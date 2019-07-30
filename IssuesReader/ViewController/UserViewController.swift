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
	
	@IBOutlet weak var userTableView: UITableView!
	
	var presenter: UserViewPresenterProtocol?
	var users = [User]()
	
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
			let userParser = UserParser(withFile: Constants.issuesFileName)
			let userService = UserService(with: userParser)
			presenter = userViewPresenter(with: userService, and: self)
		}
	}
	
	func loadUsers(users: [User]) {
		self.users = users
		userTableView.reloadData()
	}
}

extension UserViewController: UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return users.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let userCell = tableView
			.dequeueReusableCell(withIdentifier: Constants.userTableViewCellIdentifier) as? UserTableViewCell
			else {
				return UITableViewCell()
		}
		userCell.fillCell(user: users[indexPath.row])
		return userCell
	}	
	
}
