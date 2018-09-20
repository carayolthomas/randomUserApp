//
//  UserEntity+Mock.swift
//  RandomUserAppTests
//
//  Created by Thomas Carayol on 20/09/2018.
//  Copyright © 2018 Thomas Carayol. All rights reserved.
//

import Foundation
@testable import RandomUserApp

extension UserEntity {
    
    static func mocked(first: String) -> UserEntity {
        return UserEntity(gender: .female, name: UserNameEntity(title: "", first: first, last: ""), location: UserLocationEntity(street: "", city: "", state: "", postcode: ""), email: "", phone: "", cell: "", picture: UserPictureEntity(large: ""), nat: "")
    }
}
