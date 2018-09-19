//
//  APIRouterError.swift
//  RandomUserApp
//
//  Created by Thomas Carayol on 18/09/2018.
//  Copyright © 2018 Thomas Carayol. All rights reserved.
//

import Foundation

/// APIRouterError lists all the different errors that may occur for our API
enum APIRouterError: Error {
    case routeNotValid
    case emptyResponseBody
}

extension APIRouterError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .routeNotValid:
            return NSLocalizedString("RouteNotValid", tableName: "APIError", comment: "")
        case .emptyResponseBody:
            return NSLocalizedString("EmptyResponseBody", tableName: "APIError", comment: "")
        }
    }
}
