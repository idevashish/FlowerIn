//
//  TableDataModel.swift
//  FlowerIn
//
//  Created by Ashish Shukla on 14/03/22.
//

import Foundation
import UIKit

class TableDataModel: NSObject {
    
    static var leftTableData = [["Description":"Lillies", "Price":"$10.00", "Unit":0, "Available":true, "Image":"Flower11"],
                                        ["Description":"Tulips", "Price":"$10.00", "Unit":0, "Available":true, "Image":"Flower22"],
                                        ["Description":"Alstroemeria", "Price":"$10.00", "Unit":0, "Available":false, "Image":"Flower33"],
                                        ["Description":"Asters", "Price":"$10.00", "Unit":0, "Available":true, "Image":"Flower44"]]
    
    static var rightTableData = [["Description":"Glass Vase", "Price":"$10.00", "Unit":10, "Available":true, "Image":"Vase1"],
                                         ["Description":"Basket", "Price":"$10.00", "Unit":10, "Available":false, "Image":"Vase2"],
                                         ["Description":"Small Basket", "Price":"$10.00", "Unit":10, "Available":true, "Image":"Vase3"],
                                         ["Description":"Pot", "Price":"$10.00", "Unit":10, "Available":true, "Image":"Vase4"]]
}
