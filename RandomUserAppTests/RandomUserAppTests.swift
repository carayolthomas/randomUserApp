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
    
    /// Test the UserListPresenter data output
    func testUserListPresenterData() {
        // Create a mock view controller
        let module = MockUserListRouter.createModule() as! MockUserListViewController
        // Retrieve mock data from interactor
        if let presenter = module.presenter as? UserListPresenter {
            presenter.pageSize = 20
            presenter.getUsers(pageNumber: 1)
        }
        
        XCTAssert(module.presenter?.numberOfSections() == 1)
        XCTAssert(module.presenter?.numberOfRows(section: 0) == 2, "should have two rows because mock interactor returns a maximum of two users")
        XCTAssertTrue(module.presenter?.content(at: IndexPath(row: 0, section: 0))?.string.contains("Lydia") ?? false, "the first mock user should have Lydia as firstname")
        XCTAssertTrue(module.presenter?.content(at: IndexPath(row: 1, section: 0))?.string.contains("App") ?? false, "the second mock user should have App as firstname")
        XCTAssertFalse(module.presenter?.shouldRetrieveMoreUsers ?? true)
    }
    
    func testUserListPresenterPaging() {
        // Create a mock view controller
        let module = MockUserListRouter.createModule() as! MockUserListViewController
        // Retrieve mock data from interactor
        if let presenter = module.presenter as? UserListPresenter {
            presenter.pageSize = 1
            presenter.getUsers(pageNumber: 1)
        }
        
        XCTAssert(module.presenter?.numberOfRows(section: 0) == 1, "should have one rows because we asked for one result")
        XCTAssertTrue(module.presenter?.content(at: IndexPath(row: 0, section: 0))?.string.contains("Lydia") ?? false, "the first mock user should have Lydia as firstname")
        XCTAssertTrue(module.presenter?.shouldRetrieveMoreUsers ?? false)
        
        if let presenter = module.presenter as? UserListPresenter {
            presenter.pageSize = 1
            presenter.getUsers(pageNumber: 2)
        }
        
        XCTAssert(module.presenter?.numberOfRows(section: 0) == 2, "should have two rows because we asked for one more result")
        XCTAssertTrue(module.presenter?.content(at: IndexPath(row: 0, section: 0))?.string.contains("Lydia") ?? false, "the first mock user should have Lydia as firstname")
        XCTAssertTrue(module.presenter?.content(at: IndexPath(row: 1, section: 0))?.string.contains("Lydia") ?? false, "the second mock user should have Lydia as firstname")
        XCTAssertTrue(module.presenter?.shouldRetrieveMoreUsers ?? false)
    }
}
