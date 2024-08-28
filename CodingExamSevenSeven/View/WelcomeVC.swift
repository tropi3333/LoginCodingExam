//
//  WelcomeVC.swift
//  CodingExamSevenSeven
//
//  Created by Jomar Calandria on 8/28/24.
//

import UIKit

class WelcomeVC: UIViewController {

    var userName:String?
    
    @IBOutlet weak var lblUsername: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        lblUsername.text = userName
    }
    

 

}
