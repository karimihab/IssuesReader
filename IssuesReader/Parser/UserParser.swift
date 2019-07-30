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
typealias parseUserCallback = (usersRows?) -> Void


protocol UserParserProtocol {
	func parseUsers(callback: @escaping parseUserCallback)
}

class UserParser: UserParserProtocol {

	var fileName = ""
	
	init(withFile file: String) {
		fileName = file
	}
	
	func parseUsers(callback: @escaping parseUserCallback){
		do {
			guard let csvFile = Bundle.main.path(forResource: fileName,
												 ofType: Constants.issuesFileType) else {
													print("Error: Can't open file, file doesn't exist")
													callback(nil)
													return
			}
			
			let content = try CSV(name: csvFile, loadColumns: true)
			callback(content.namedRows)
			return
		} catch let parseError as CSVParseError {
			print(parseError.localizedDescription)
			
		} catch let err{
			print(err.localizedDescription)
			
		}
		callback(nil)
		return
	}
}
