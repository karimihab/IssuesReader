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
		
		print(UserService(with: UserParser()).getUsers())
	}

	
}

