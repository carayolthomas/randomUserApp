//
//  XCUIApplication+UserDetails.swift
//  RandomUserAppUITests
//
//  Created by Thomas Carayol on 20/09/2018.
//  Copyright © 2018 Thomas Carayol. All rights reserved.
//

import XCTest

extension XCUIApplication {
    
    var isDisplayingUserDetails: Bool {
        return tables["UserDetailsTableViewIdentifier"].exists
    }
    
    func goBack() {
        navigationBars.buttons.element(boundBy: 0).tap()
    }
}
