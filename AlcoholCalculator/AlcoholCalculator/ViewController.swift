//
//  ViewController.swift
//  AlcoholCalculator
//
//  Created by egor aleksandrovich on 07.01.2023.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var calculations: Results<Calculation>!
    let scrollView = UIScrollView()
    let contentView = UIView()

    @IBOutlet weak var headerTitle: UIView!
    @IBOutlet weak var labelPreText: UILabel!
    @IBOutlet weak var newTestButton: UIButton!
    @IBOutlet weak var mainTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calculations = realm.objects(Calculation.self)
        
        headerTitle.layer.cornerRadius = 20
        headerTitle.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        newTestButton.layer.cornerRadius = 25
        navigationController?.navigationBar.isHidden = true
        self.view.sendSubviewToBack(mainTableView)
        
        labelPreText.isHidden = true
        
    }
    
    @IBAction func unwindSegueHome(segue: UIStoryboardSegue) {
        
        guard let newCalc = segue.source as? DataEntryViewController else { return }
        newCalc.saveCalculation()
        mainTableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.contentInset.top = 150
        return calculations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        
        cell.viewCell.layer.cornerRadius = 20
        
        let calculation = calculations[indexPath.row]
        
        if calculation.manOrWoman == 0 {
            cell.genderImage.image = UIImage(named: "man")
        } else {
            cell.genderImage.image = UIImage(named: "woman")
        }
        cell.yourWeight.text = calculation.weight
        cell.amountStrong.text = calculation.hardAlcohol
        cell.amountWine.text = calculation.wine
        cell.amountCocktail.text = calculation.cocktail
        cell.amountBeer.text = calculation.beer
        cell.amountPromiles.text = calculation.yourPPM
        
        return cell
    }
    
    // MARK: - Table view delegate
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//    }
    
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//
//        if editingStyle == .delete {
////            let place = places[indexPath.row]
////            StorageManager.deleteObject(place)
//            tableView.deleteRows(at: [indexPath], with: .automatic)
//        }
//    }
    
}

