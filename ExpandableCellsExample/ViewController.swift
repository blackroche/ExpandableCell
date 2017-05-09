//
//  ViewController.swift
//  ExpandableCellsExample
//
//  Created by DC on 28.08.2016.
//  Copyright © 2016 Dawid Cedrych. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDataSource, UICollectionViewDelegate {

    let imgs = ["0", "1", "2", "0", "1", "2", "0", "1", "2", "0", "1", "2", "0", "1", "2", "0", "1", "2", "0", "1", "2"]
    let categories = ["Sandwiches", "McNuggets & Chicken", "Fries & Sides", "Big Flavour Wraps", "Saver Menu", "Happy Meals", "Salads", "Cold Drinks", "Milkshakes", "McCafe Iced Drinks", "Bottled Drinks", "Hot Drinks", "McFlurry & Ice Cream", "Sweet Snacks", "The Signature Collection"]
    
    let allItems = ["Fries & Sides": ["Large Fries", "Medium Fries", "Small Fries", "Spicy Nacho Cheese Wedges", "Mozzarella Dippers", "Carrot Sticks", "Apple & Grape Fruit Bag"], "Sandwiches": ["Big Mac", "The Signature Classic", "The Signature BBQ", "The Signature Spicy", "Quarter Pounder with Cheese", "Filet-o-fish", "Chicken Legend with BBQ Sauce", "Chicken Legend with Cool Mayo", "Chicken Legend with Hot & Spicy Mayo", "Spicy Vegetable Deluxe", "Vegetable Deluxe", "McChicken Sandwich", "Double Cheeseburger", "Hamburger", "Cheeseburger"]]
    
    let starbucksMenu = ["Featured Drinks": ["Cappuccino Freddo", "Cold Brew with Vanilla Swvar Cream", "Cold Brew", "Nitro Cold Brew", "Flat White", "Caffe Latte", "Caffe Americano", "Piccino", "Espresso Macchiato"], "Brewed Coffee": ["Caffe Misto", "Freshly Brewed Coffee"]]
    let starbucksMenuCategories = ["Featured Drinks", "Brewed Coffee"]
    let imageNames = ["Caffe Misto", "Freshly Brewed Coffee"]
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    var expandedRows = Set<Int>()
    var word: Int?
    var itemsArray = [String]()
    var selectedCategory = String()
    var array = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 88.0
//        self.collectionView.delegate = self
//        self.collectionView.dataSource = self
        
    }
    
    // TableView DataSource methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:ExpandableCell = tableView.dequeueReusableCell(withIdentifier: "ExpandableCell") as! ExpandableCell
        //cell.img.image = UIImage(named: imgs[indexPath.row])
        cell.isExpanded = self.expandedRows.contains(indexPath.row)
        cell.categoryLbl.text = categories[indexPath.row]
        cell.categoryImage.image = UIImage(named: categories[indexPath.row])
        //cell.layer.borderWidth = 0.5
        
       
        
        return cell
    }
    
    
     func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 144.0
    }
    
    
    // TableView Delegate methods
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        word = indexPath.row
        guard let cell = tableView.cellForRow(at: indexPath) as? ExpandableCell
            else { return }
        
        switch cell.isExpanded
        {
        case true:
            self.expandedRows.remove(indexPath.row)
            self.selectedCategory = ""
        case false:
            self.expandedRows.insert(indexPath.row)
            self.selectedCategory = categories[indexPath.row]
            print(self.selectedCategory)
        }
        
        
        
        
        //self.array = starbucksMenu[starbucksMenuCategories[indexPath.row]]!
        //self.collectionView.reloadData()
        cell.menuItems = allItems["Fries & Sides"]!
        cell.categoryItems = allItems["Fries & Sides"]!
        cell.isExpanded = !cell.isExpanded
        self.itemsArray = allItems["Fries & Sides"]!
        self.tableView.beginUpdates()
        self.tableView.endUpdates()
        
        
        

        }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? ExpandableCell
            else { return }

        self.expandedRows.remove(indexPath.row)
        
        cell.isExpanded = false

        self.tableView.beginUpdates()
        self.tableView.endUpdates()

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //let array = allItems.keys as! [String]
        
       // let dict = array[word!]
        //print(self.selectedCategory)
        
        return (allItems["Fries & Sides"]?.count)!
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! CustomCollectionViewCell
        //What is this CustomCollectionCell? Create a CustomCell with SubClass of UICollectionViewCell
        //Load images w.r.t IndexPath
        print(self.selectedCategory.description)
        let newArray = starbucksMenu[selectedCategory]
        cell.image.image = UIImage(named: (allItems[selectedCategory]?[indexPath.row])!)
        cell.label.text = allItems[selectedCategory]?[indexPath.row]
        //cell.layer.borderWidth = 0.1
        
        
        
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let clickedIndex = imgs[indexPath.row]
        
        
        //print(clickedIndex)
    }



}

