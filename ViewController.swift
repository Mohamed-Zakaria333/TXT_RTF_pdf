//
//  ViewController.swift
//  SearchBarInTable
//
//  Created by Xiaodan Wang on 10/20/17.
//  Copyright © 2017 Xiaodan Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    var counter1 = 0;
    var counter2 = 0;
    @IBOutlet var table: UITableView!
    @IBOutlet var searchBar: UISearchBar!
    
    var animalArray = [Animal]()
    var currentAnimalArray = [Animal]() //update table
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("================")
        let x = AnimalType.cat
        print(x)
        print (AnimalType.cat)
        let y = AnimalType.mmm
        print(y)
        print (AnimalType.mmm)
        let z = AnimalType.dog
        print(z)
        print (AnimalType.dog)
        print("================")
        setUpAnimals()
        setUpSearchBar()
        alterLayout()
    }
    
    private func setUpAnimals() {
        // CATS
        animalArray.append(Animal(name: "Amber", category: .cat, image:"1"))
        animalArray.append(Animal(name: "James", category: .cat, image:"2"))
        animalArray.append(Animal(name: "Peter", category: .cat, image:"3"))
        // DOGS
        animalArray.append(Animal(name: "Haywood", category: .dog, image:"4"))
        animalArray.append(Animal(name: "Shell", category: .dog, image:"5"))
        animalArray.append(Animal(name: "James", category: .dog, image:"6"))
        
        currentAnimalArray = animalArray
    }
    
    private func setUpSearchBar() {
        searchBar.delegate = self
    }
    
    func alterLayout() {
        table.tableHeaderView = UIView()
        // search bar in section header
        table.estimatedSectionHeaderHeight = 50
        // search bar in navigation bar
        //navigationItem.leftBarButtonItem = UIBarButtonItem(customView: searchBar)
        navigationItem.titleView = searchBar
        
        searchBar.placeholder = "Search Animal by Name"
        //my additions
        searchBar.showsScopeBar = true // you can show/hide this dependant on your layout mack an segment controller
        
        searchBar.showsCancelButton=true
        searchBar.showsBookmarkButton=true
        searchBar.showsSearchResultsButton=true
        
        
    }
        
    // Table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentAnimalArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? TableCell else {
            return UITableViewCell()
        }
        cell.nameLbl.text = currentAnimalArray[indexPath.row].name
        cell.categoryLbl.text = currentAnimalArray[indexPath.row].category.rawValue
        cell.imgView.image = UIImage(named:currentAnimalArray[indexPath.row].image)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    // This two functions can be used if you want to show the search bar in the section header
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        return searchBar
//    }
    
//    // search bar in section header
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return UITableViewAutomaticDimension
//    }
    
    // Search Bar
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // show the cancel button
        //called when write first letter
        searchBar.showsCancelButton = true
        counter1=counter1 + 1
        print("====================================================")
        print ("     searchBar>>>textDidChange searchText  \(counter1)     ")
        print ("     called when i add new character each time i increment counter to chek calling     ")
        
        print("====================================================")
        //=============
        //here is the closures used  { closur body     }
    
        currentAnimalArray = animalArray.filter({ animal -> Bool in
            switch searchBar.selectedScopeButtonIndex {
            case 0:
                if searchText.isEmpty { return true }
                return animal.name.lowercased().contains(searchText.lowercased())
            case 1:
                if searchText.isEmpty { return animal.category == .dog }
                return animal.name.lowercased().contains(searchText.lowercased()) &&
                animal.category == .dog
            case 2:
                if searchText.isEmpty { return animal.category == .cat }
                return animal.name.lowercased().contains(searchText.lowercased()) &&
                animal.category == .cat

            default:
                return false
            }
        })
        table.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        //implement segment controller Yaries
        counter2 = counter2 - 1
        print("====================================================")
        print ("     searchBar>>>selectedScopeButtonIndexDidChange selectedScope \(counter2)")
        print("====================================================")
        
        
        switch selectedScope {
        case 0:
            currentAnimalArray = animalArray
        case 1:
            currentAnimalArray = animalArray.filter({ animal -> Bool in
                animal.category == AnimalType.dog
            })
        case 2:
            currentAnimalArray = animalArray.filter({ animal -> Bool in
                animal.category == AnimalType.cat
            })
        //addition scope
        case 3:
            currentAnimalArray = animalArray.filter({ animal -> Bool in
                animal.category == AnimalType.cat})
        default:
            break
        }
        table.reloadData()
    }
    //my additions
    //zakaria
    //===============================================
    
    /*func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        // Do some search stuff
    }*/
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        // Stop doing the search stuff
        // and clear the text in the search bar
        searchBar.text = ""
        // Hide the cancel button
        searchBar.showsCancelButton = false
        // You could also change the position, frame etc of the searchBar
    }
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        print("====================================================")
        print ("     searchBarShouldEndEditing    ")
        print("====================================================")
        
        return true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        print("====================================================")
        print ("     searchBarTextDidEndEditing    ")
        print("====================================================")
    }
    func searchBarBookmarkButtonClicked(_ searchBar: UISearchBar) {
        print("====================================================")
        print ("     searchBarBookmarkButtonClicked    ")
        print ("     IM list button put inside UISearchbar   ")
        print("====================================================")
    }
    func searchBarResultsListButtonClicked(_ searchBar: UISearchBar) {
        print("====================================================")
        print ("     searchBarResultsListButtonClicked    ")
        print("====================================================")
    }
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        print("====================================================")
        print ("     searchBarShouldBeginEditing    ")
         print ("     called when i tabbed on uisearchBar without any typing   ")
        
        print("====================================================")
        return true
    }
    
    
    
    
    
    //===============================================
    
    
    
    
    
  func my_col()
{
    let example = Example.A// (Enum Value)
    print (example)
    let five = Numbers.Five
    print(five.rawValue)                      // 5
    print(five.hashValue)
    let possibleNum = Numbers(rawValue: 2)!
    print(possibleNum == Numbers.Two)       // true}
    }
    
    
}
// outside the class
class Animal {
    let name: String
    let image: String
    let category: AnimalType
    
    init(name: String, category: AnimalType, image: String) {
        self.name = name
        self.category = category
        self.image = image
    }
}
//outside any class
enum AnimalType: String {
    case cat = "Cat"
    case mmm = "cawsssss"
    case dog = "Dog"
}
enum Example {
    case A
    case B
    case C
    case D
}
enum Letters: Character {
    case a = "A"
    case b = "B"
    case c = "C"
}
enum Numbers: Int {
    case One = 1, Two, Three, Four, Five
}

//closures
//special functions do a specific work
/*
 {
 (parameters) −> return type in
 statements
 }
 //====================
 let studname = { print("Welcome to Swift Closures") }
 studname()  // print Welcome to Swift Closures
 //====================
 {
 (Int, Int) −> Bool in
 Statement1
 Statement 2
 ---
 Statement n
 }
 //===================
 let divide = {
 (val1: Int, val2: Int) -> Int in
 return val1 / val2
 }
 
 let result = divide(200, 20)
 print (result)
 //===================
 let sum = {
 (no1: Int, no2: Int) -> Int in
 return no1 + no2
 }
 
 let digits = sum(10, 20)
 print(digits)
 //===================
 As an argument to a function call:
 
 funcName({ (ParameterTypes) -> ReturnType in statements })
 As a function parameter:
 
 array.sorted(by: { (item1: Int, item2: Int) -> Bool in return item1 < item2 })
 As a function parameter with implied types:
 
 array.sorted(by: { (item1, item2) -> Bool in return item1 < item2 })
 As a function parameter with implied return type:
 
 array.sorted(by: { (item1, item2) in return item1 < item2 })
 As the last function parameter:
 
 array.sorted { (item1, item2) in return item1 < item2 }
 As the last parameter, using shorthand argument names:
 
 array.sorted { return $0 < $1 }
 As the last parameter, with an implied return value:
 
 array.sorted { $0 < $1 }
 As the last parameter, as a reference to an existing function:
 
 array.sorted(by: <)
 As a function parameter with explicit capture semantics:
 
 array.sorted(by: { [unowned self] (item1: Int, item2: Int) -> Bool in return item1 < item2 })
 As a function parameter with explicit capture semantics and inferred parameters / return type:
 
 array.sorted(by: { [unowned self] in return $0 < $1 })
 
 
 
 
 
 
 
 
 //functions
 func student(name: String) -> String {
 return name
 }
 
 print(student(name: "First Program"))
 print(student(name: "About Functions"))
 //======================
 func display(no1: Int) -> Int {
 let a = no1
 return a
 }
 
 print(display(no1: 100))
 print(display(no1: 200))
 //======================
 func ls(array: [Int]) -> (large: Int, small: Int) {
 var lar = array[0]
 var sma = array[0]
 
 for i in array[1..<array.count] {
 if i < sma {
 sma = i
 } else if i > lar {
 lar = i
 }
 }
 return (lar, sma)
 }
 
 let num = ls(array: [40,12,-5,78,98])
 print("Largest number is: \(num.large) and smallest number is: \(num.small)")
 //====================
 
 
 
 
 
 
 */

















