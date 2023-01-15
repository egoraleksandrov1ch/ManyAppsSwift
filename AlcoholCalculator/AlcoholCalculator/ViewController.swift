//
//  ViewController.swift
//  AlcoholCalculator
//
//  Created by egor aleksandrovich on 07.01.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let arr = ["1", "2", "3", "3", "3", "3", "3", "3", "3", "3", "3", "3", "3", "3", "3", "3", "3"]
    
    let scrollView = UIScrollView()
    let contentView = UIView()

    @IBOutlet weak var headerTitle: UIView!
    @IBOutlet weak var labelPreText: UILabel!
    @IBOutlet weak var newTestButton: UIButton!
    @IBOutlet weak var mainTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        headerTitle.layer.cornerRadius = 20
        headerTitle.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        newTestButton.layer.cornerRadius = 25
        navigationController?.navigationBar.isHidden = true
        self.view.sendSubviewToBack(mainTableView)
        
        labelPreText.isHidden = true
        
    }
    
    // MARK: - Table view data source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.contentInset.top = 150
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        
        cell.viewCell.layer.cornerRadius = 20
        
        cell.genderImage.image = UIImage(named: "woman")
        cell.yourWeight.text = "80"
        cell.amountStrong.text = "1"
        cell.amountWine.text = "2"
        cell.amountCocktail.text = "4"
        cell.amountBeer.text = "10"
        cell.amountPromiles.text = "2,10"
        
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
    
    
    
//    func setupScrollView() {
//
//        scrollView.translatesAutoresizingMaskIntoConstraints = false
//        contentView.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(scrollView)
//        view.sendSubviewToBack(scrollView)
//        scrollView.addSubview(contentView)
//
//        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
//        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//
//        contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
//        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
//        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
//        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
//
//        setupViews()
//    }
    
//    func setupViews(){
//
//        contentView.addSubview(titleLabel)
//        titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
//        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 150).isActive = true
//        titleLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 3/4).isActive = true
//
//        contentView.addSubview(subtitleLabel)
//        subtitleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
//        subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 25).isActive = true
//        subtitleLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 3/4).isActive = true
//        subtitleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
//    }
}

