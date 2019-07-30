//
//  IssuesService.swift
//  IssuesReader
//
//  Created by Karim Ihab on 29/07/2019.
//  Copyright © 2019 rabobank. All rights reserved.
//

import Foundation

typealias getUsersCallback = ([User]?) -> Void

protocol UserServiceProtocol {
	func getUsers(callback: @escaping getUsersCallback)
}

class UserService: UserServiceProtocol {
	let userParser:UserParserProtocol?
	let userStorageService:UserStorageServiceProtocol?
	
	init(with parser:UserParserProtocol, andStorageService service:UserStorageServiceProtocol) {
		userParser = parser
		userStorageService = service
	}
	
	func getUsers(callback: @escaping getUsersCallback) {
		
		userStorageService?.fetchUsers(callback: { [weak self] users in
			
			let strongSelf = self
			
			//1. User Doesn't exists locally, Need to parse it
			if users == nil || users?.count == 0 {
				strongSelf?.userParser?.parseUsers(callback: { (usersRows) in
					//Parsing users failed
					guard let strongSelf = self,
						let rows = usersRows else {
							print("UserService Error: Can't get users")
							callback(nil)
							return
					}
					//Parsing users succeeded
					strongSelf.createUsers(from: rows) { users in
						guard let usersList = users else {
							callback(nil)
							return
						}
						callback(usersList)
						strongSelf.userStorageService?.storeUsers(users: usersList, callback: { (didStore) in
							if didStore {
								print("UserService: users list saved successfully")
							} else {
								print("UserService Error: failed to save users list")
							}
						})
						return
					}
				})
			} else { // User exists locally, just return it
				callback(users)
				return
			}
			
		})
	}
	
	func createUsers(from usersRows:usersRows, callback: @escaping getUsersCallback) {
		var users =  [User]()
		
		for user in usersRows {
			guard let firstName = user[Constants.firstNameKey],
				let surName = user[Constants.surNameKey],
				let birthDate = user[Constants.birthDateKey],
				let issuesCount = user[Constants.issuesCountKey] else {
					print("IssuesParserService Error: Couldn't read row")
					continue
			}
			users.append(User(firstName: firstName, surName: surName, birthDate: birthDate, issuesCount: issuesCount))
		}
		if users.count == 0 {
			callback(nil)
			return
		} else {
			callback(users)
			return
		}
		
	}
}
