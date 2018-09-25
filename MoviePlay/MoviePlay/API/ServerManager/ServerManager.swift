//
//  ServerManager.swift
//  MoviePlay
//
//  Created by tuyente on 9/24/18.
//  Copyright © 2018 tuyente. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

struct APIService {
    
    static let share = APIService()
    
    private var alamofireManager = Alamofire.SessionManager.default
    
    init() {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30
        configuration.timeoutIntervalForResource = 30
        alamofireManager = Alamofire.SessionManager(configuration: configuration)
    }
    
    func request<T: Mappable>(input: BaseRequest, completion: @escaping (_ value: T?,_ error: BaseError?) -> Void) {
        print("\n------------REQUEST INPUT")
        print("link: %@", input.url)
        print("body: %@", input.body ?? "No Body")
        print("------------ END REQUEST INPUT\n")
        
        alamofireManager.request(input.url, method: input.requestType, parameters: input.body, encoding: input.encoding)
            .validate(statusCode: 200..<500)
            .responseJSON { response in
                print(response.request?.url ?? "Error")
                print(response)
                switch response.result {
                case .success(let value):
                    guard let statusCode = response.response?.statusCode else{
                        return completion(nil, BaseError.unexpectedError)
                    }
                        if statusCode != 200 {
                            guard let error = Mapper<ErrorResponse>().map(JSONObject: value) else{
                               return completion(nil, BaseError.httpError(httpCode: statusCode))
                            }
                                completion(nil, BaseError.apiFailure(error: error))
                            }
                         else {
                            let object = Mapper<T>().map(JSONObject: value)
                            completion(object, nil)
                        }
                case .failure(let error):
                    completion(nil, error as? BaseError)
                }
        }
    }
}
