//
//  BaseError.swift
//  MoviePlay
//
//  Created by tuyente on 9/24/18.
//  Copyright © 2018 tuyente. All rights reserved.
//

import Foundation

enum BaseError: Error {
    case networkError
    case httpError(httpCode: Int)
    case unexpectedError
    case apiFailure(error: ErrorResponse?)
    
    public var errorMessage: String? {
        switch self {
        case .networkError:
            return "Network Error"
        case .httpError(let code):
            return getHttpErrorMessage(httpCode: code)
        case .apiFailure(let error):
            if let error = error {
                return error.message
            }
            return "Error"
        default:
            return "Unexpected Error"
        }
    }
    
    private func getHttpErrorMessage(httpCode: Int) -> String? {
        switch httpCode {
        case 300...308:
            return "It was transferred to a different URL. I'm sorry for causing you trouble";
        case 400...451:
            return "An error occurred on the application side. Please try again later!";
        case 500...451:
            return "A server error occurred. Please try again later!";
        default:
             return "An error occurred. Please try again later!";
        }
    }
}

