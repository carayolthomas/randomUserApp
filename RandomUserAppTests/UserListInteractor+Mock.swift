//
//  UserListInteractor+Mock.swift
//  RandomUserAppTests
//
//  Created by Thomas Carayol on 20/09/2018.
//  Copyright © 2018 Thomas Carayol. All rights reserved.
//

import Foundation
@testable import RandomUserApp

final class MockUserListInteractor: UserListPresenterToInteractorProtocol {
    
    weak var presenter: UserListInteractorToPresenterProtocol?
    
    func getUserListFromAPI(result: Int, page: Int) {
        if result == 1 {
            let results: [UserEntity] = [UserEntity.mocked(first: "Lydia")]
            let info: UserListInfoEntity = UserListInfoEntity(results: results.count, page: page)
            self.presenter?.getUserListFromAPISuccess(response: UserListEntity(results: results, info: info))
        } else {
            let results: [UserEntity] = [UserEntity.mocked(first: "Lydia"), UserEntity.mocked(first: "App")]
            let info: UserListInfoEntity = UserListInfoEntity(results: results.count, page: page)
            self.presenter?.getUserListFromAPISuccess(response: UserListEntity(results: results, info: info))
        }
    }
    
    func getUserListFromStorage() {
        
    }
    
    func storeUserEntities(entities: UserListEntity?) {
        
    }
    
    func clearUserListFromStorage() {
        
    }
}
