//
//  IssuesService.swift
//  IssuesReader
//
//  Created by Karim Ihab on 29/07/2019.
//  Copyright © 2019 rabobank. All rights reserved.
//

import Foundation

protocol UserServiceProtocol {
	func getUsers() -> [User]?
}

class UserService {
	
	let userParser:UserParserProtocol?
	
	init(with parser:UserParserProtocol) {
		userParser = parser
	}
	
	func getUsers() -> [User]? {
		guard let usersRows = userParser?.parseUsers() else {
			print("UserService Error: Can't get users")
			return nil
		}
		return createUsers(from: usersRows)
	}
	
	func createUsers(from usersRows:usersRows) -> [User]? {
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
		
		return users
	}
}
