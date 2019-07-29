//
//  IssuesViewPresenter.swift
//  IssuesReader
//
//  Created by Karim Ihab on 29/07/2019.
//  Copyright © 2019 rabobank. All rights reserved.
//

import Foundation

protocol UserViewPresenterProtocol {
	var userService: UserServiceProtocol? { get }
	var view: UserViewProtocol? { get }

	func getUsers()
}

class userViewPresenter: UserViewPresenterProtocol {
	var userService: UserServiceProtocol?
	weak var view: UserViewProtocol?
	
	init(with userService: UserServiceProtocol, and view:UserViewProtocol) {
		self.userService = userService
		self.view = view
	}
	
	func getUsers() {
		guard let usersData = userService?.getUsers() else {
			print("userViewPresenter Error: Can't get Users")
			return
		}
		
		view?.loadUsers(users: usersData)
	}
}
