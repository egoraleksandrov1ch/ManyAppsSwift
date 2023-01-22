//
//  DataEntryViewController.swift
//  AlcoholCalculator
//
//  Created by egor aleksandrovich on 14.01.2023.
//

import UIKit

class DataEntryViewController: UIViewController, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var weight: UILabel!
    @IBOutlet weak var headerTitle: UIView!
    @IBOutlet weak var cocktail: UITextField!
    @IBOutlet weak var beer: UITextField!
    @IBOutlet weak var wine: UITextField!
    @IBOutlet weak var hardAlcohol: UITextField!
    @IBOutlet weak var timeDrink: UIDatePicker!
    @IBOutlet weak var manOrWoman: UISegmentedControl!
    
    @IBOutlet weak var dateStackView: UIStackView!
    @IBOutlet weak var alcoholStackView: UIStackView!
    @IBOutlet weak var weightStackView: UIStackView!
    
    @IBOutlet weak var textprogressView: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var quantityStackView: UIStackView!
    @IBOutlet weak var progressView: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.isHidden = true
        headerTitle.layer.cornerRadius = 20
        headerTitle.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        timeDrink.minimumDate = NSDate(timeIntervalSinceNow: -86400) as Date
        timeDrink.maximumDate = NSDate.now as Date
        
        textprogressView.layer.isHidden = true
        progressView.layer.isHidden = true
        quantityStackView.layer.isHidden = true
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(self.hideKeyboardOnSwipeDown))
            swipeDown.delegate = self
            swipeDown.direction =  UISwipeGestureRecognizer.Direction.down
            self.view.addGestureRecognizer(swipeDown)
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    @objc func hideKeyboardOnSwipeDown() {
            view.endEditing(true)
    }

    @IBAction func weightSelection(_ sender: UISlider) {
        
        weight.text = String(Int(sender.value))
    }
    
    @IBAction func calculateButton(_ sender: UIButton) {
        
        if hardAlcohol.text?.isEmpty == true && wine.text?.isEmpty == true && beer.text?.isEmpty == true && cocktail.text?.isEmpty == true {
            
            let alert = UIAlertController(title: "The field is empty", message: "Add the amount of alcohol you drink!", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default)
            alert.addAction(okAction)
            present(alert, animated: true)
        } else {
            manOrWoman.layer.isHidden = true
            dateStackView.layer.isHidden = true
            alcoholStackView.layer.isHidden = true
            weightStackView.layer.isHidden = true
            sender.layer.isHidden = true
            
            calculateFunc()
        }
    }
    
    private func calculateFunc() {
        
        textprogressView.layer.isHidden = false
        progressView.layer.isHidden = false
        progressView.setProgress(0, animated: true)
        let _ = Timer.scheduledTimer(withTimeInterval: 0.005, repeats: true) { timer in
            
            if self.progressView.progress != 1 {
                self.progressView.progress += 0.005
            } else {
                timer.invalidate()
                self.textprogressView.text = "The number of ppm in the blood:"
                self.progressView.layer.isHidden = true
                self.quantityStackView.layer.isHidden = false
            }
        }
        
        // масса выпитого напитка
        var a = 0.0
        if hardAlcohol.text?.isEmpty == false {
            let hardAlcoholQuantity = Double(Int(hardAlcohol.text!) ?? 0) * 0.4 * 0.789
            a = a + hardAlcoholQuantity
        }
        if wine.text?.isEmpty == false {
            let wineQuantity = Double(Int(wine.text!) ?? 0) * 0.13 * 0.789
            a = a + wineQuantity
        }
        if beer.text?.isEmpty == false {
            let beerQuantity = Double(Int(beer.text!) ?? 0) * 0.05 * 0.789
            a = a + beerQuantity
        }
        if cocktail.text?.isEmpty == false {
            let cocktailQuantity = Double(Int(cocktail.text!) ?? 0) * 0.2 * 0.789
            a = a + cocktailQuantity
        }
        // масса тела в килограммах
        let m = Double(Int(weight.text!) ?? 0)
        // коэффициент распределения Видмарка (0,70 — для мужчин, 0,60 — для женщин)
        var r = 0.0
        switch manOrWoman.selectedSegmentIndex {
        case 0:
            r = 0.7
        case 1:
            r = 0.6
        default:
            print("error")
        }
        // концентрация алкоголя в крови
        let c = (a * 0.8) / (m * r)
        // выведения этанола за час соответствует 0,15 ‰
        let nowDate = NSDate.now as Date
        let dateDiff = timeDrink.date.days(to: nowDate)
        
        let yourPPM = round((c - (Double(dateDiff) * 0.15)) * 100) / 100
        quantityLabel.text = String(yourPPM)
    }
    //
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension Date {
    func days(to secondDate: Date, calendar: Calendar = Calendar.current) -> Int {
        return calendar.dateComponents([.hour], from: self, to: secondDate).hour!
    }
}
