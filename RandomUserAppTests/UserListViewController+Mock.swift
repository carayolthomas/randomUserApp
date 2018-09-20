//
//  UserListViewController+Mock.swift
//  RandomUserAppTests
//
//  Created by Thomas Carayol on 20/09/2018.
//  Copyright © 2018 Thomas Carayol. All rights reserved.
//

import Foundation
import UIKit
@testable import RandomUserApp

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
