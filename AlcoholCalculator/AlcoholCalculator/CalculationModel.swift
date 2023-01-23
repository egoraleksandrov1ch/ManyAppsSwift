//
//  CalculationModel.swift
//  AlcoholCalculator
//
//  Created by egor aleksandrovich on 23.01.2023.
//

import UIKit
import RealmSwift

class Calculation: Object {
    
    @Persisted var manOrWoman: Int?
    @Persisted var weight: String?
    @Persisted var yourPPM: String?
    @Persisted var hardAlcohol: String?
    @Persisted var wine: String?
    @Persisted var beer: String?
    @Persisted var cocktail: String?
    
    convenience init(manOrWoman: Int?, weight: String?, yourPPM: String?, hardAlcohol: String?, wine: String?, beer: String?, cocktail: String?) {
        self.init()
        self.manOrWoman = manOrWoman
        self.weight = weight
        self.yourPPM = yourPPM
        self.hardAlcohol = hardAlcohol
        self.wine = wine
        self.beer = beer
        self.cocktail = cocktail
    }
}
