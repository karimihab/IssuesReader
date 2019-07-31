//
//  Mocks.swift
//  IssuesReaderTests
//
//  Created by Karim Ihab on 30/07/2019.
//  Copyright © 2019 rabobank. All rights reserved.
//

import Foundation

@testable import IssuesReader

class  UserParserMock: UserParserProtocol {
	
	var userRowsStub = [[String:String]]()
	var parseUsersCalled = false
	var parseUserShouldFail = false
	
	func parseUsers(callback: @escaping ParseUserCallback) {
		parseUsersCalled = true
		if parseUserShouldFail {
			callback(nil)
			return
		} else {
			callback(userRowsStub)
			return
			
		}
	}
}

class UserServiceMock: UserServiceProtocol {
	
	var usersStub = [User]()
	var getUsersIsCalled = false
	var getUsersShouldFail = false
	
	func getUsers(callback: @escaping GetUsersCallback) {
		getUsersIsCalled = true
		if getUsersShouldFail {
			callback(nil)
			return
		} else {
			callback(usersStub)
			return
		}
	}
}

class UserViewMock: UserViewProtocol{
	
	var loadUsersIsCalled = false
	
	func loadUsers(users: [User]) {
		loadUsersIsCalled = true
	}
}


class UserViewPresenterMock: UserViewPresenterProtocol {
	
	var userService: UserServiceProtocol?
	var view: UserViewProtocol?
	
	var getUsersisCalled = false
	
	func getUsers() {
		getUsersisCalled = true
	}
	
	
}

class MockUserDefaults : UserDefaults {
	
	convenience init() {
		self.init(suiteName: "Mock User Defaults")!
	}
	
	override init?(suiteName suitename: String?) {
		UserDefaults().removePersistentDomain(forName: suitename!)
		super.init(suiteName: suitename)
	}
	
}

class userStorageServiceMock: UserStorageServiceProtocol {
	
	var fetchUsersShouldFail = false
	var storeUsersShoudlFail = false
	
	var fetchUsersIsCalled = false
	var storeUsersIsCalled = false
	
	let usersListStub = [User(firstName: "Karim", surName: "Ihab", birthDate: "1-2-4", issuesCount: "100")]
	
	func fetchUsers(callback: @escaping FetchUsersCallback) {
		fetchUsersIsCalled = true
		if fetchUsersShouldFail {
			callback(nil)
		} else {
			callback(usersListStub)
		}
	}
	
	func storeUsers(users: [User], callback: @escaping StoreUsersCallback) {
		storeUsersIsCalled = true
		if storeUsersShoudlFail {
			callback(false)
		} else {
			callback(true)
		}
		
	}
	
	
}
