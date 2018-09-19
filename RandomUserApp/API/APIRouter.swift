//
//  APIRouter.swift
//  RandomUserApp
//
//  Created by Thomas Carayol on 18/09/2018.
//  Copyright © 2018 Thomas Carayol. All rights reserved.
//

import Foundation

/// APIRouter lists all the different routes for the RandomUser API
enum APIRouter {
    
    /// Case to get random user list
    /// - parameter: result The number of random user to get
    /// - parameter: page The page to get
    case getUserList(result: Int, page: Int)
    
    /// URL for the selected APIRouter case
    var route: URL? {
        switch self {
        case .getUserList(let result, let page):
            let queryItemResult = URLQueryItem(name: "results", value: String(result))
            let queryItemPage = URLQueryItem(name: "page", value: String(page))
            return URLComponents.randomAPIUrl(with: [queryItemResult, queryItemPage])
        }
    }
    
    /// Creates and returns an URLRequest from an URL
    /// This function throws an exception if it couldn't retrieve a valid URL
    func asURLRequest() throws -> URLRequest {
        
        guard let route = self.route else {
            throw APIRouterError.routeNotValid
        }
        
        return URLRequest(url: route)
    }
}
