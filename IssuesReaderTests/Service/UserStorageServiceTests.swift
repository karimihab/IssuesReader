//
//  UserStorageServiceTests.swift
//  IssuesReaderTests
//
//  Created by Karim Ihab on 30/07/2019.
//  Copyright © 2019 rabobank. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import IssuesReader

class UserStorageServiceTest: QuickSpec {
	override func spec() {
		describe("User Storage Service Testing") {
			
			guard let mockDefaults = MockUserDefaults(suiteName: "TestDefaults") else {
				fail()
				return
			}
			let sut = UserStorageService(withDefaults: mockDefaults)
			
			it("correctly saves users list") {
				let usersList = [User(firstName: "Karim", surName: "Ihab", birthDate: "1-1-1", issuesCount: "100")]
				waitUntil { done in
					sut.storeUsers(users: usersList, callback: { (didSave) in
						expect(didSave).to(beTrue())
						done()
					})
				}
			}
			
			it("correctly loads users list") {
				waitUntil { done in
					sut.fetchUsers(callback: { (users) in
						expect(users?.count).to(equal(1))
						expect(users?.first?.issuesCount).to(equal("100"))
						expect(users?.first?.firstName).to(equal("Karim"))
						expect(users?.first?.surName).to(equal("Ihab"))
						done()
					})
				}
			}
		}
	}
}
