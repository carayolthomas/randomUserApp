//
//  UserListRouter+Mock.swift
//  RandomUserAppTests
//
//  Created by Thomas Carayol on 20/09/2018.
//  Copyright © 2018 Thomas Carayol. All rights reserved.
//

import Foundation
import UIKit
@testable import RandomUserApp

final class MockUserListRouter: UserListPresenterToRouterProtocol {
    
    static func createModule() -> UIViewController {
        let view = MockUserListViewController()
        let interactor: UserListPresenterToInteractorProtocol = MockUserListInteractor()
        let router: UserListPresenterToRouterProtocol = UserListRouter()
        let presenter: UserListViewToPresenterProtocol & UserListInteractorToPresenterProtocol = UserListPresenter(view: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        
        return view
    }
    
    func showDetails(from: UserListPresenterToViewProtocol?, with: UserEntity) {}
}
