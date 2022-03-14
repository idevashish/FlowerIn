//
//  FlowersListVC.swift
//  FlowerIn
//
//  Created by Ashish Shukla on 14/03/22.
//

import UIKit

class FlowersListVC: UIViewController {

    //MARK - Outlets
    
    @IBOutlet weak var rightTableView: UITableView!
    @IBOutlet weak var leftTableView: UITableView!
    
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    
    @IBOutlet weak var flowersLimitLabel: UILabel!
    
    @IBOutlet weak var imageListView: UIView!
    @IBOutlet weak var imageCollectionView: UIView!
    
    private var dragView: UIView?
    
    var flowerCart = [[String:Any]]()
    var cellFlower = FlowerViewCell()
    
    //MARK - Class methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rightTableView.delegate = self
        rightTableView.dataSource = self
        
        leftTableView.delegate = self
        leftTableView.dataSource = self
        
        flowersLimitLabel.text = "Flowers Limit Left: 10"
    }
    
    func updateFlowersLimit() {
        flowersLimitLabel.text = "Flowers Limit Left: \(10-flowerCart.count)"
    }
    
    @objc func didLongPressCell (recognizer: UILongPressGestureRecognizer) {
        if flowerCart.count >= 10 {
            return
        }
        switch recognizer.state {
        case .began:
            if let cellView = recognizer.view as? FlowerViewCell {
                print(cellView)
                cellFlower = cellView
                cellView.frame.origin = cellView.frame.origin
                
                let imageView = UIImageView()
                imageView.frame = cellFlower.itemImageView.frame
                imageView.image = cellFlower.itemImageView.image
                
                dragView = imageView
                view.addSubview(dragView!)
            }
        case .changed:
            dragView?.center = recognizer.location(in: view)
        case .ended:
            if (dragView == nil) {return}
            
            if (dragView!.frame.intersects(imageListView.frame)) {
                let cellView = dragView as! UIImageView
                cellView.frame.origin = imageCollectionView.frame.origin
                
                let imageView = UIImageView()
                imageView.frame = CGRect(x: 10, y: 5, width: 105, height: 95)
                imageView.image = cellFlower.itemImageView.image
                imageView.contentMode = .scaleAspectFit
                
                imageCollectionView.addSubview(imageView)
                
                dragView?.removeFromSuperview()
                dragView = nil
                
                if cellFlower.tableDataType == "Right" {
                    flowerCart.append(TableDataModel.rightTableData[cellFlower.tag])
                } else {
                    flowerCart.append(TableDataModel.leftTableData[cellFlower.tag])
                }
                
                updateFlowersLimit()
            } else {
                //DragView was not dropped in dropszone... Rewind animation...
                dragView?.removeFromSuperview()
                dragView = nil
            }
        default:
            print("Any other action?")
        }
    }
    
    //MARK - Button actions
    
    @IBAction func doneButtonAction(_ sender: UIButton) {
        
    }
    
    @IBAction func deleteButtonAction(_ sender: UIButton) {
        let alert = UIAlertController(title: "", message: "Are you sure you want to delete?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
            let views = self.imageCollectionView.subviews
            for view in views {
                view.removeFromSuperview()
            }
            self.flowerCart.removeAll()
            //rightTableView.reloadData()
            //leftTableView.reloadData()
            self.flowersLimitLabel.text = "Flowers Limit Left: 10"
        }))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

//MARK - TableView delegate and datasources

extension FlowersListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == rightTableView {
            return TableDataModel.rightTableData.count
        } else {
            return TableDataModel.leftTableData.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FlowerViewCell.self), for: indexPath) as! FlowerViewCell
        
        var flowerDict = [String:Any]()
        if tableView == rightTableView {
            flowerDict = TableDataModel.rightTableData[indexPath.row]
            cell.itemUnit.isHidden = false
            cell.tableDataType = "Right"
        } else {
            flowerDict = TableDataModel.leftTableData[indexPath.row]
            
            cell.itemUnit.isHidden = true
            cell.tableDataType = "Left"
        }
        
        cell.updateCellForItem(item: flowerDict)
        if let isAvailable = flowerDict["Available"] as? Bool {
            if isAvailable {
                let lpGestureRecognizer: UILongPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(didLongPressCell))
                cell.addGestureRecognizer(lpGestureRecognizer)
                cell.isUserInteractionEnabled = true
                cell.tag = indexPath.row
            } else {
                cell.isUserInteractionEnabled = false
            }
        }
        
        return cell
    }
}

