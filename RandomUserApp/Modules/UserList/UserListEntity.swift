//
//  UserListEntity.swift
//  RandomUserApp
//
//  Created by Thomas Carayol on 18/09/2018.
//  Copyright © 2018 Thomas Carayol. All rights reserved.
//

import Foundation

enum UserGender: String, Codable {
    case male
    case female
}

/// Represents the user name information in the user list
struct UserNameEntity: Codable {
    
    /// Title
    private(set) var title: String
    
    /// Firstname
    private(set) var first: String
    
    /// Lastname
    private(set) var last: String
}

/// Represents the user picture info
struct UserPictureEntity: Codable {
    
    /// Big picture
    private(set) var large: String
}

/// Represents the user location info
struct UserLocationEntity: Codable {
    
    /// Street
    private(set) var street: String
    
    /// City
    private(set) var city: String
    
    /// State
    private(set) var state: String
    
    /// Postcode
    private(set) var postcode: AnyCodable
}

/// Represents the user information in the user list
struct UserEntity: Codable {
    
    /// Gender
    private(set) var gender: UserGender
    
    /// Name entity
    private(set) var name: UserNameEntity
    
    /// Location
    private(set) var location: UserLocationEntity
    
    /// Email
    private(set) var email: String
    
    /// Phone number
    private(set) var phone: String
    
    /// Cell phone number
    private(set) var cell: String
    
    // Picture
    private(set) var picture: UserPictureEntity
    
    /// Country code
    private(set) var nat: String
}

/// Represents the user list paging info
struct UserListInfoEntity: Codable {
    
    /// The number of results of the page
    private(set) var results: Int
    
    /// The current page
    private(set) var page: Int
}

/// Represents the user list
struct UserListEntity: Codable {
    
    /// The user list
    var results: [UserEntity]
    
    /// The user list paging info
    var info: UserListInfoEntity
}
