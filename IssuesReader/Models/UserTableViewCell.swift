//
//  UserTableViewCell.swift
//  IssuesReader
//
//  Created by Karim Ihab on 29/07/2019.
//  Copyright © 2019 rabobank. All rights reserved.
//

import Foundation
import UIKit

class UserTableViewCell: UITableViewCell {
	
	@IBOutlet weak var surNameLabel: UILabel!
	@IBOutlet weak var firstNameLabel: UILabel!
	@IBOutlet weak var dateOfBirthLabel: UILabel!
	@IBOutlet weak var issuesCountLabel: UILabel!
	
	func fillCell(user: User) {
		surNameLabel.text = "\(user.surName),"
		firstNameLabel.text = user.firstName
		dateOfBirthLabel.text = DateUtility.formatDate(dateString: user.birthDate)
		issuesCountLabel.text = user.issuesCount
	}
}
