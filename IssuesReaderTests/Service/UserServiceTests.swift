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
			let sut = UserService(with: userParser, andStorageService: UserStorageService())

//			it("calls userParser when getUsers is called") {
//				userParser.parseUserShouldFail = false
//				waitUntil { done in
//					sut.getUsers { _ in
//						expect(userParser.parseUsersCalled).to(beTrue())
//						done()
//					}
//				}
//			}
//			
//			it("fails when userParser fails") {
//				userParser.parseUserShouldFail = true
//				waitUntil { done in
//					sut.getUsers { users in
//						expect(users).to(beNil())
//						done()
//					}
//				}
//			}
//			
//			it("correctly creates users list") {
//				userParser.parseUserShouldFail = false
//				let userRow = [Constants.firstNameKey:"Karim",
//							   Constants.surNameKey: "Badawy",
//							   Constants.birthDateKey:"1-1-1",
//							   Constants.issuesCountKey:"100"]
//				userParser.userRowsStub.append(userRow)
//				
//				waitUntil { done in
//					sut.getUsers { users in
//						guard let usersList = users else {
//							fail("User List is Empty")
//							return
//						}
//						expect(usersList.count).to(equal(1))
//						expect(usersList.first?.firstName).to(equal("Karim"))
//						expect(usersList.first?.issuesCount).to(equal("100"))
//						done()
//					}
//				}
//			}

			
		}
	}
}
