//
//  IssuesViewPresenter.swift
//  IssuesReader
//
//  Created by Karim Ihab on 29/07/2019.
//  Copyright © 2019 rabobank. All rights reserved.
//

import Foundation
import UIKit

protocol UserViewPresenterProtocol {
	var userService: UserServiceProtocol? { get }
	var view: UserViewProtocol? { get }
	
	func getUsers()
}

class UserViewPresenter: UserViewPresenterProtocol {
	
	var userService: UserServiceProtocol?
	weak var view: UserViewProtocol?
	
	init(with userService: UserServiceProtocol, and view: UserViewProtocol) {
		self.userService = userService
		self.view = view
	}
	
	func getUsers() {
		
		//Running get user on a diff thread.
		DispatchQueue.global(qos: .background).async { [weak self] in
			guard let strongSelf = self else { return }
			strongSelf.userService?.getUsers(callback: { users in
				guard let usersList = users else {
					DispatchQueue.main.async {
						UIAlertController(title: "Error", message: "Can't get Users", preferredStyle: .alert).show()
					}
					return
				}
				
				//loading users back on the main thread
				DispatchQueue.main.async {
					strongSelf.view?.loadUsers(users: usersList)
				}
			})
		}
	}
}
