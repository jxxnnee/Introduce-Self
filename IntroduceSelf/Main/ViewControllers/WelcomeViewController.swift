//
//  WelcomeViewController.swift
//  RxIntroduce
//
//  Created by 민경준 on 2019/12/11.
//  Copyright © 2019 민경준. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var userId: UILabel!
    
    @IBOutlet weak var userName: UILabel!
    var paramUserID: String?
    var paramUserName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userId.text = paramUserID
        userName.text = paramUserName
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
