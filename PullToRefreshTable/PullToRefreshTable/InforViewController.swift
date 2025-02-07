//
//  InforViewController.swift
//  PullToRefreshTable
//
//  Created by AlexTran on 06/02/2025.
//

import UIKit

class InforViewController: UIViewController {

    @IBOutlet weak var lbtext: UILabel!
    var item :String?
    override func viewDidLoad() {
        super.viewDidLoad()
        lbtext.text = item ?? "No data"
    }
    

    /*
    // MARK: - Navigation
     @IBOutlet weak var lbText: UILabel!
     
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
