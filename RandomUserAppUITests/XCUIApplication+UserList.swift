//
//  XCUIApplication+UserList.swift
//  NoorUITests
//
//  Created by Thomas Carayol on 20/09/2018.
//  Copyright © 2018 Appstud. All rights reserved.
//

import XCTest

extension XCUIApplication {
    
    var isDisplayingUserList: Bool {
        return tables["UserListTableViewIdentifier"].exists
    }

    func tapOnFirstElement() {
        tables["UserListTableViewIdentifier"].cells.element(boundBy: 0).tap()
    }
}
