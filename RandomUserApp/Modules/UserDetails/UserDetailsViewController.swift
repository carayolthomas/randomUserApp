//
//  UserDetailsViewController.swift
//  RandomUserApp
//
//  Created Thomas Carayol on 18/09/2018.
//  Copyright © 2018 Thomas Carayol. All rights reserved.
//
//  Template generated by Thomas Carayol @Appstud
//

import UIKit
import Kingfisher

class UserDetailsViewController: UITableViewController {

    @IBOutlet var userImageView: UIImageView!
    @IBOutlet var flagLabel: UILabel!
    @IBOutlet var genderImageView: UIImageView!
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var cellLabel: UILabel!
    @IBOutlet var homeLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    
    var presenter: UserDetailsViewToPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.viewDidLoad()
    }
}

extension UserDetailsViewController: UserDetailsPresenterToViewProtocol {
    
    func show(flag: String) {
        self.flagLabel.text = flag
    }
    
    func show(name: String) {
        self.title = name
    }
    
    func show(email: String) {
        self.emailLabel.text = email
    }
    
    func show(gender: UIImage?) {
        self.genderImageView.image = gender
    }
    
    func show(userPicture: URL) {
        let processor = RoundCornerImageProcessor(cornerRadius: 21)
        self.userImageView.kf.setImage(with: userPicture, options: [.transition(.fade(0.2)), .processor(processor)])
    }
    
    func show(cellPhone: String) {
        self.cellLabel.text = cellPhone
    }
    
    func show(homePhone: String) {
        self.homeLabel.text = homePhone
    }
    
    func show(locationAddress: String) {
        self.locationLabel.text = locationAddress
    }
}
