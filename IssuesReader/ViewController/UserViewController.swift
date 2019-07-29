//
//  ViewController.swift
//  IssuesReader
//
//  Created by Karim Ihab on 26/07/2019.
//  Copyright © 2019 rabobank. All rights reserved.
//

import UIKit
import SwiftCSV

protocol UserViewProtocol: class {
	func loadUsers(users: [User])
}
class UserViewController: UIViewController,  UserViewProtocol {
	
	var presenter: UserViewPresenterProtocol?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setPresenter()
	}
	
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		
		presenter?.getUsers()
	}
	
	func setPresenter() {
		if presenter == nil {
			let userParser = UserParser()
			let userService = UserService(with: userParser)
			presenter = userViewPresenter(with: userService, and: self)
		}
	}
	
	func loadUsers(users: [User]) {
		print(users)
	}
}

