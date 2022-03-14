//
//  FlowerViewCell.swift
//  FlowerIn
//
//  Created by Ashish Shukla on 14/03/22.
//

import UIKit

class FlowerViewCell: UITableViewCell {

    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var dragImageView: UIImageView!
    
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemUnit: UILabel!
    @IBOutlet weak var itemPrice: UILabel!
    
    @IBOutlet weak var outOfStockView: UIView!
    
    @IBOutlet weak var outOfStockLabel: UILabel!
    
    var tableDataType = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func prepareForReuse() {
        itemImageView.image = nil
        itemName.text = ""
        itemUnit.text = ""
        itemPrice.text = ""
        dragImageView.isHidden = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateCellForItem(item: [String:Any]) {
        if let imageName = item["Image"] as? String {
            itemImageView.image = UIImage(named: imageName)
            dragImageView.isHidden = true
            dragImageView.image = UIImage(named: imageName)
        }
        if let name = item["Description"] as? String {
            itemName.text = name
        }
        if let unit = item["Unit"] as? Int {
            itemUnit.text = "Flower Limit: \(unit)"
        }
        if let price = item["Price"] as? String {
            itemPrice.text = price
        }
        if let isAvailable = item["Available"] as? Bool {
            if isAvailable {
                outOfStockView.isHidden = true
                outOfStockLabel.isHidden = true
            } else {
                outOfStockView.isHidden = false
                outOfStockLabel.isHidden = false
            }
        }
    }

}
