//
//  Mocks.swift
//  IssuesReaderTests
//
//  Created by Karim Ihab on 30/07/2019.
//  Copyright © 2019 rabobank. All rights reserved.
//

@testable import IssuesReader

class  UserParserMock: UserParserProtocol {
	
	var userRowsStub = [[String:String]]()
	var parseUsersCalled = false
	var parseUserShouldFail = false
	
	func parseUsers(callback: @escaping parseUserCallback) {
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
	
	func getUsers(callback: @escaping getUsersCallback) {
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
