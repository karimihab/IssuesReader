//
//  IssuesStorageService.swift
//  IssuesReader
//
//  Created by Karim Ihab on 29/07/2019.
//  Copyright © 2019 rabobank. All rights reserved.
//

import Foundation

typealias fetchUsersCallback = ([User]?) -> Void
typealias storeUsersCallback = (Bool) -> Void

protocol UserStorageServiceProtocol {
	func fetchUsers(callback: @escaping fetchUsersCallback)
	func storeUsers(users: [User], callback: @escaping storeUsersCallback)
}

class UserStorageService: UserStorageServiceProtocol {
	
	var userDefaults:UserDefaults?
	
	init(withDefaults defaults: UserDefaults = UserDefaults.standard) {
		self.userDefaults = defaults
	}
	
	func fetchUsers(callback: @escaping fetchUsersCallback) {
		var decodedUsers: [User]?
		do {
			guard let decoded  = userDefaults?.data(forKey: Constants.usersLocalStorageKey) else {
				callback(nil)
				return
			}
			decodedUsers = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(decoded) as? [User]
			
		} catch let err {
			print("UserStorageService Error: \(err.localizedDescription)")
			callback(nil)
			return
		}
		callback(decodedUsers)
		return
	}
	
	func storeUsers(users: [User], callback: @escaping storeUsersCallback){
		let encodedData:Data?
		do {
			encodedData = try NSKeyedArchiver.archivedData(withRootObject: users, requiringSecureCoding: false)
			userDefaults?.set(encodedData, forKey: Constants.usersLocalStorageKey)
			userDefaults?.synchronize()
			
		} catch let err {
			print("UserStorageService Error:\(err.localizedDescription)")
			callback(false)
			return
		}
		callback(true)
		return
	}
}
