//
//  MainTabBarController.swift
//  AlcoholCalculator
//
//  Created by egor aleksandrovich on 15.01.2023.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    let heightScreenIphone = UIScreen.main.bounds

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if heightScreenIphone.height > 800 {
            tabBar.backgroundImage = UIImage()
            tabBar.backgroundColor = .clear
            tabBar.shadowImage = UIImage()
            setTabBarAppearnce()
        } else {
            tabBar.backgroundColor = UIColor.mainWhite
        }
    }
    
    private func setTabBarAppearnce() {
        
        let positionOnX: CGFloat = 10
        let positionOnY: CGFloat = 14
        let width = tabBar.bounds.width - positionOnX * 2
        let height = tabBar.bounds.height + positionOnY * 2
        
        let roundLayer = CAShapeLayer()
        
        let bezierPath = UIBezierPath(
            roundedRect: CGRect(
                x: positionOnX,
                y: tabBar.bounds.minY - positionOnY,
                width: width,
                height: height
            ),
            cornerRadius: height / 2
        )
        
        roundLayer.path = bezierPath.cgPath
        tabBar.layer.insertSublayer(roundLayer, at: 0)
        roundLayer.fillColor = UIColor.mainWhite.cgColor
        
    }

}
