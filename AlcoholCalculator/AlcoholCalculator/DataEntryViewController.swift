//
//  DataEntryViewController.swift
//  AlcoholCalculator
//
//  Created by egor aleksandrovich on 14.01.2023.
//

import UIKit

class DataEntryViewController: UIViewController {

    @IBOutlet weak var headerTitle: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.isHidden = true
        headerTitle.layer.cornerRadius = 20
        headerTitle.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
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
