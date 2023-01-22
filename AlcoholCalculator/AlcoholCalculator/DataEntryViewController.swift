//
//  DataEntryViewController.swift
//  AlcoholCalculator
//
//  Created by egor aleksandrovich on 14.01.2023.
//

import UIKit

class DataEntryViewController: UIViewController {
    
    @IBOutlet weak var dateTime: UIDatePicker!
    @IBOutlet weak var cocktailText: UITextField!
    @IBOutlet weak var beerText: UITextField!
    @IBOutlet weak var wineText: UITextField!
    @IBOutlet weak var hardAlcoholText: UITextField!
    @IBOutlet weak var weight: UILabel!
    @IBOutlet weak var gender: UISegmentedControl!
    @IBOutlet weak var headerTitle: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.isHidden = true
        headerTitle.layer.cornerRadius = 20
        headerTitle.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }

    @IBAction func weightSelection(_ sender: Any) {
    }
    
    @IBAction func buttonCalculation(_ sender: Any) {
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
