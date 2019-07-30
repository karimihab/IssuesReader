//
//  UserParserTest.swift
//  IssuesReaderTests
//
//  Created by Karim Ihab on 30/07/2019.
//  Copyright © 2019 rabobank. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import IssuesReader

class UserParserTest: QuickSpec {
	override func spec() {
		describe("User Parser Testing") {
			
			var sut: UserParser!
			
			it("can parse csv file") {
				sut = UserParser(withFile: "issues_test")
				waitUntil { done in
					sut.parseUsers { users in
						expect(users).toNot(beNil())
						done()
					}
				}
			}
			
			it("callback is nil when error happends") {
				sut = UserParser(withFile: "issues_test_wrong_file")
				waitUntil { done in
					sut.parseUsers { users in
						expect(users).to(beNil())
						done()
					}
				}
			}
			
			it("can correctly parse csv file") {
				sut = UserParser(withFile: "issues_test")
				waitUntil { done in
					sut.parseUsers { users in
						expect(users).toNot(beNil())
						expect(users?.count).to(equal(2))
						expect(users?[1].count).to(equal(4))
						done()
					}
				}
			}
		}
	}
}
