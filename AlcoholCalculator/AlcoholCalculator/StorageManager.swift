//
//  StorageManager.swift
//  AlcoholCalculator
//
//  Created by egor aleksandrovich on 23.01.2023.
//

import RealmSwift

let realm = try! Realm()

class StorageManager {
    
    static func saveObject(_ calculation: Calculation) {
        
        try! realm.write {
            realm.add(calculation)
        }
    }
    
    static func deleteObject(_ calculation: Calculation) {
        
        try! realm.write {
            realm.delete(calculation)
        }
    }
}
