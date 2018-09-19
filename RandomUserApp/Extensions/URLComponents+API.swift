//
//  URLComponents+API.swift
//  RandomUserApp
//
//  Created by Thomas Carayol on 18/09/2018.
//  Copyright © 2018 Thomas Carayol. All rights reserved.
//

import Foundation

extension URLComponents {
    
    /// Creates and initializes an `URL` with the given `URLQueryItem` list
    /// for the randomuser API.
    /// - parameter: items The `URLQueryItem` list to append.
    static func randomAPIUrl(with items: [URLQueryItem]) -> URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "randomuser.me"
        components.path = "/api/1.0"
        components.queryItems = items
        return components.url
    }
}
