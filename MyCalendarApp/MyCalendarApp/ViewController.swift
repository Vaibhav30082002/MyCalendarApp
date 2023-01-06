//
//  ViewController.swift
//  MyCalenderApp
//
//  Created by Vaibhav Shah on 05/01/23.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    

    
    @IBOutlet var monthLbl: UILabel!
    
    @IBOutlet var CalenderCollectionView: UICollectionView!
    
    var selectedDate = Date()
    var totalBoxes = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setCellsView()
        setMonthView()
    }
    
    
    func setCellsView() {
        let width = (CalenderCollectionView.frame.size.width - 2) / 8
        let height = (CalenderCollectionView.frame.size.height - 2) / 8
        let fullLayout = CalenderCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        fullLayout.itemSize = CGSize(width: width, height: height)
        
    }
    
    func setMonthView(){
        totalBoxes.removeAll()
        let daysInMonth = Helper().daysInMonth(date: selectedDate)
        let firstDayofMonth = Helper().firstOfMonth(date: selectedDate)
        let startingSpace = Helper().weekDay(date: firstDayofMonth)
        
        var count : Int = 1
        
        while(count <= 42){
            if(count <= startingSpace || count - startingSpace > daysInMonth ){
                totalBoxes.append("")
            }else{
                totalBoxes.append(String(count - startingSpace))
            }
            count += 1
        }
        monthLbl.text = Helper().monthInitials(date: selectedDate) + " " + Helper().yearInitials(date: selectedDate)
        CalenderCollectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        totalBoxes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = CalenderCollectionView.dequeueReusableCell(withReuseIdentifier: "calendarCell", for: indexPath) as! CalendarCell
        
        cell.dayofmonthLbl.text = totalBoxes[indexPath.item]
        
        return cell
    }

    @IBAction func previousbtn(_ sender: Any) {
        selectedDate = Helper().decrementMonth(date: selectedDate)
        setMonthView()
    }
    
    @IBAction func nxtbtn(_ sender: Any) {
        selectedDate = Helper().incrementMonth(date: selectedDate)
        setMonthView()
    }
    
    override open var shouldAutorotate: Bool
    {
        return false
    }
}

