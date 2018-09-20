//
//  RandomUserAppTests.swift
//  RandomUserAppTests
//
//  Created by Thomas Carayol on 18/09/2018.
//  Copyright © 2018 Thomas Carayol. All rights reserved.
//

import XCTest
@testable import RandomUserApp

class RandomUserAppTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let module = MockUserListRouter.createModule() as! MockUserListViewController
        module.presenter?.interactor?.getUserListFromAPI(result: 20, page: 1)
        XCTAssert(module.presenter?.numberOfRows(section: 0) == 2)
        
        XCTAssertTrue(true)
    }
}

final class MockUserListInteractor: UserListPresenterToInteractorProtocol {
    
    weak var presenter: UserListInteractorToPresenterProtocol?
    
    func getUserListFromAPI(result: Int, page: Int) {
        let results: [UserEntity] = [UserEntity.mocked(), UserEntity.mocked()]
        let info: UserListInfoEntity = UserListInfoEntity(results: results.count, page: page)
        self.presenter?.getUserListFromAPISuccess(response: UserListEntity(results: results, info: info))
    }
    
    func getUserListFromStorage() {
        
    }
    
    func storeUserEntities(entities: UserListEntity?) {
        
    }
    
    func clearUserListFromStorage() {
        
    }
}

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
    
    func showDetails(from: UserListPresenterToViewProtocol?, with: UserEntity) {
        
    }
}

final class MockUserListViewController: UIViewController, UserListPresenterToViewProtocol {
    
    var presenter: UserListViewToPresenterProtocol?
    
    func showCenteredLoading() {}
    
    func hideCenteredLoading() {}
    
    func insertRows(at: [IndexPath]) {}
    
    func showTableView() {}
    
    func updateNavigationBar() {}
    
    func showError(error: String) {}
    
    func deselectRows() {}
}

extension UserEntity {
    
    static func mocked() -> UserEntity {
        return UserEntity(gender: .female, name: UserNameEntity(title: "", first: "", last: ""), location: UserLocationEntity(street: "", city: "", state: "", postcode: ""), email: "", phone: "", cell: "", picture: UserPictureEntity(large: ""), nat: "")
    }
}
