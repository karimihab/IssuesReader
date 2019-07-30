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
	
	init(with parser:UserParserProtocol) {
		userParser = parser
	}
	
	func getUsers(callback: @escaping getUsersCallback) {
		userParser?.parseUsers(callback: { [weak self] usersRows in
			guard let strongSelf = self,
				let rows = usersRows else {
					print("UserService Error: Can't get users")
					callback(nil)
					return
			}
			strongSelf.createUsers(from: rows) { users in
				guard let usersList = users else {
					callback(nil)
					return
				}
				callback(usersList)
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
