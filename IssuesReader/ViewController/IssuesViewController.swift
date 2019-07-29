//
//  ViewController.swift
//  IssuesReader
//
//  Created by Karim Ihab on 26/07/2019.
//  Copyright © 2019 rabobank. All rights reserved.
//

import UIKit
import SwiftCSV

class IssuesViewController: UIViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		getData()
	}
	
	
	func getData() {
		do {
			guard let csvFile = Bundle.main.path(forResource: "issues", ofType: "csv") else {
				print("Error: Can't open file, file doesn't exist")
				return
			}
			
			let content = try CSV(name: csvFile, loadColumns: true)
			for row in content.namedRows {
				print("\n")
				print(row)
				print("\n")
			}
			
		} catch let parseError as CSVParseError {
			print(parseError.localizedDescription)
			
		} catch let err{
			print(err.localizedDescription)
			
		}
	}
	
	
}

