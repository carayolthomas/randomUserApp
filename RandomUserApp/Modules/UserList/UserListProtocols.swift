//
//  UserListProtocols.swift
//  RandomUserApp
//
//  Created Thomas Carayol on 18/09/2018.
//  Copyright © 2018 Thomas Carayol. All rights reserved.
//
//  Template generated by Thomas Carayol @Appstud
//

import Foundation
import UIKit

/// Delegates from the presenter (business rules) to the view (ui)
protocol UserListPresenterToViewProtocol: class {
    
    /// Create & show a loader at the center of the view
    func showCenteredLoading()
    
    /// Stop & hide the loader from the view
    func hideCenteredLoading()
    
    /// Insert indexPaths at the bottom of the `UITableView`
    func insertRows(at: [IndexPath])
    
    /// Create & shows a `UITableView`
    func showTableView()
    
    /// Update the content of the `UINavigationBar`
    func updateNavigationBar()
    
    /// Show error
    func showError(error: String)
    
    /// Deselect selected row
    func deselectRows()
}

/// Delegates from the interactor (api/storage) to the view (ui)
protocol UserListInteractorToPresenterProtocol: class {
    
    /// Callback when a new response from the API is available
    func getUserListFromAPISuccess(response: UserListEntity)
    
    /// Callback when an error from the API has occurred
    func getUserListFromAPIError(error: String)
    
    /// Callback when data from the storage is available
    func getUserListFromStorageSuccess(response: UserListEntity)
    
    /// Callback when an error from the storage has occurred
    func getUserListFromStorageError(error: String)
}

/// Delegates from the presenter (business rules) to the interactor (api/storage)
protocol UserListPresenterToInteractorProtocol: class {
    
    var presenter: UserListInteractorToPresenterProtocol?  { get set }
    
    /// Retrieve a user list from the API
    /// - parameter: result The number of users wanted
    /// - parameter: page The page needed
    func getUserListFromAPI(result: Int, page: Int)
    
    /// Retrieve a user list from the storage
    func getUserListFromStorage()
    
    /// Store a user list to the disk
    func storeUserEntities(entities: UserListEntity?)
    
    /// Clear a user list from the disk
    func clearUserListFromStorage()
}

/// Delegates from the view (ui) to the presenter (business rules)
protocol UserListViewToPresenterProtocol: class {
    
    var view: UserListPresenterToViewProtocol? { get set }
    var interactor: UserListPresenterToInteractorProtocol? { get set }
    var router: UserListPresenterToRouterProtocol? { get set }
    
    /// Indicates if it should get more users from interactor
    var shouldRetrieveMoreUsers: Bool { get }
    
    /// The size the each page we get from API
    var pageSize: Int { get set }
    
    /// Return the number of sections needed for the `UITableView`
    func numberOfSections() -> Int
    
    /// Return the number of rows needed for a section
    func numberOfRows(section: Int) -> Int
    
    /// Return the attributed content to display in the cell
    func content(at: IndexPath) -> NSAttributedString?
    
    /// Callback when a user tapped on a cell
    func didSelectRow(at: IndexPath)
    
    /// Callback when a row will be displayed
    func willDisplayRow(at: IndexPath)
    
    /// Callback when view has loaded
    func viewDidLoad()
    
    /// Callback when view will appear
    func viewWillAppear()
}

/// Delegates from the presenter (business rules) to the router (navigation)
protocol UserListPresenterToRouterProtocol: class {
    
    /// Initializes and creates a new module
    static func createModule() -> UIViewController
    
    /// Show the next module for the given user
    func showDetails(from: UserListPresenterToViewProtocol?, with: UserEntity)
}
