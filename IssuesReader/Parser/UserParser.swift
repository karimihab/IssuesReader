//
//  IssuesParserService.swift
//  IssuesReader
//
//  Created by Karim Ihab on 29/07/2019.
//  Copyright © 2019 rabobank. All rights reserved.
//

import Foundation
import SwiftCSV

typealias usersRows = [[String:String]]

protocol UserParserProtocol {
	func parseUsers() -> usersRows?
}

class UserParser: UserParserProtocol {

	func parseUsers() -> usersRows? {
		do {
			guard let csvFile = Bundle.main.path(forResource: Constants.issuesFileName,
												 ofType: Constants.issuesFileType) else {
													print("Error: Can't open file, file doesn't exist")
													return nil
			}
			
			let content = try CSV(name: csvFile, loadColumns: true)
			return content.namedRows
			
		} catch let parseError as CSVParseError {
			print(parseError.localizedDescription)
			
		} catch let err{
			print(err.localizedDescription)
			
		}
		return nil
	}
}
