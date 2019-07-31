//
//  User.swift
//  IssuesReader
//
//  Created by Karim Ihab on 29/07/2019.
//  Copyright © 2019 rabobank. All rights reserved.
//

import Foundation

class User: NSObject, NSCoding {
	var firstName: String
	var surName: String
	var birthDate: String
	var issuesCount: String
	
	init(firstName: String, surName: String, birthDate: String, issuesCount: String) {
		self.firstName = firstName
		self.surName = surName
		self.birthDate = birthDate
		self.issuesCount = issuesCount
	}
	
	required convenience init(coder aDecoder: NSCoder) {
		guard let firstName = aDecoder.decodeObject(forKey: "firstName") as? String,
		let surName = aDecoder.decodeObject(forKey: "surName") as? String,
		let birthDate = aDecoder.decodeObject(forKey: "birthDate") as? String,
			let issuesCount = aDecoder.decodeObject(forKey: "issuesCount") as? String else {
				self.init(firstName: "", surName: "", birthDate: "", issuesCount: "")
				print("User Error: Couldn't decode User Object")
				return
		}
		self.init(firstName: firstName, surName: surName, birthDate: birthDate, issuesCount: issuesCount)
	}
	
	func encode(with aCoder: NSCoder) {
		aCoder.encode(firstName, forKey: "firstName")
		aCoder.encode(surName, forKey: "surName")
		aCoder.encode(birthDate, forKey: "birthDate")
		aCoder.encode(issuesCount, forKey: "issuesCount")
	}	
}
