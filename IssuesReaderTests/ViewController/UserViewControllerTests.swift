//
//  UserViewControllerTests.swift
//  IssuesReaderTests
//
//  Created by Karim Ihab on 30/07/2019.
//  Copyright © 2019 rabobank. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import IssuesReader

class UserViewControllerTest: QuickSpec {
	override func spec() {
		describe("User View Controller Testing") {
			
			let userPresenter = UserViewPresenterMock()
			var sut: UserViewController!
			
			beforeEach {

				let storyboard = UIStoryboard(name: "Main", bundle: nil)
				sut = storyboard.instantiateViewController(withIdentifier: "UserViewController") as? UserViewController
				sut.presenter = userPresenter
				
				let window = UIWindow(frame: UIScreen.main.bounds)
				window.makeKeyAndVisible()
				window.rootViewController = sut
				sut.beginAppearanceTransition(true, animated: false) // Triggers viewWillAppear
				sut.endAppearanceTransition() // Triggers viewDidAppear
			}
			
			it("Initialize View correctly") {
				expect(sut.view).toNot(beNil())
			}
			
			it("sets the presenter on viewDidLoad") {
				expect(sut.presenter).toNot(beNil())
			}
			
			it("calls get users on the presenter on viewDidAppear") {
				expect(userPresenter.getUsersisCalled).to(beTrue())
			}
		}
	}
}

