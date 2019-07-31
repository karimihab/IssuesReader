//
//  DateUtility.swift
//  IssuesReader
//
//  Created by Karim Ihab on 31/07/2019.
//  Copyright © 2019 rabobank. All rights reserved.
//

import Foundation

class DateUtility {
	
	static func formatDate(dateString: String ) -> String {
		let dateFormatterGet = DateFormatter()
		dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
		
		let dateFormatterPrint = DateFormatter()
		dateFormatterPrint.dateFormat = "MMM dd, yyyy"
		
		if let date = dateFormatterGet.date(from: dateString) {
			return dateFormatterPrint.string(from: date)
		} else {
			print("There was an error decoding the string")
			return ""
		}
	}
}
