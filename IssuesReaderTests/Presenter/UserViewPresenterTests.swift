//
//  IssuesViewPresenterTests.swift
//  IssuesReaderTests
//
//  Created by Karim Ihab on 29/07/2019.
//  Copyright © 2019 rabobank. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import IssuesReader

class UserViewPresenterTest: QuickSpec {
	override func spec() {
		describe("User View Presenter Testing") {
			
			let userView = UserViewMock()
			var userService: UserServiceMock!
			var sut: userViewPresenter!

			it("doesn't calls loadUsers on the view in case of failure") {
				userService = UserServiceMock()
				userService.getUsersShouldFail = true
				sut = userViewPresenter(with: userService, and: userView)
				sut.getUsers()
				expect(userView.loadUsersIsCalled).toEventually(beFalse())
			}

			it("calls getUsers on userService when its own getUsers is called") {
				userService = UserServiceMock()
				sut = userViewPresenter(with: userService, and: userView)
				sut.getUsers()
				expect(userService.getUsersIsCalled).toEventually(beTrue())
			}

			it("calls loadUsers on the view in case of success") {
				userService = UserServiceMock()
				sut = userViewPresenter(with: userService, and: userView)
				sut.getUsers()
				expect(userView.loadUsersIsCalled).toEventually(beTrue())
			}
		}
	}
}
