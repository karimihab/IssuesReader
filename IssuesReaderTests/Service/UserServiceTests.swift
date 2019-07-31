//
//  UserServiceTests.swift
//  IssuesReaderTests
//
//  Created by Karim Ihab on 30/07/2019.
//  Copyright © 2019 rabobank. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import IssuesReader

class UserServiceTest: QuickSpec {
	override func spec() {
		describe("User Service Testing") {

			
			let userParser = UserParserMock()
			let userStorageService = userStorageServiceMock()
			let sut = UserService(with: userParser, andStorageService: userStorageService)

			it("doesn't call userParser when user data is stored locally") {
				userStorageService.fetchUsersShouldFail = false
				waitUntil { done in
					sut.getUsers { _ in
						expect(userParser.parseUsersCalled).to(beFalse())
						done()
					}
				}
			}
			
			it("calls userParser when user data is not stored locally") {
				userStorageService.fetchUsersShouldFail = true
				waitUntil { done in
					sut.getUsers { _ in
						expect(userParser.parseUsersCalled).to(beTrue())
						done()
					}
				}
			}
			
			it("correctly creates users list") {
				userStorageService.fetchUsersShouldFail = true
				let userRow = [Constants.firstNameKey:"Karim",
							   Constants.surNameKey: "Badawy",
							   Constants.birthDateKey:"1-1-1",
							   Constants.issuesCountKey:"100"]
				userParser.userRowsStub.append(userRow)
				
				waitUntil { done in
					sut.getUsers { users in
						guard let usersList = users else {
							fail("User List is Empty")
							return
						}
						expect(usersList.count).to(equal(1))
						expect(usersList.first?.firstName).to(equal("Karim"))
						expect(usersList.first?.issuesCount).to(equal("100"))
						done()
					}
				}
			}
		}
	}
}
