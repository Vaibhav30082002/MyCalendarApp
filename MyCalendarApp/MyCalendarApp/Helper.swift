//
//  Helper.swift
//  MyCalenderApp
//
//  Created by Vaibhav Shah on 06/01/23.
//

import Foundation
import UIKit

class Helper{
    let calendar = Calendar.current
    
    func incrementMonth(date: Date) -> Date
    {
        return calendar.date(byAdding: .month, value: 1, to: date)!
        
    }
    
    func decrementMonth(date: Date) -> Date
    {
        return calendar.date(byAdding: .month, value: -1, to: date)!
        
    }
    
    func monthInitials(date: Date) -> String{
        let dateForm = DateFormatter()
        dateForm.dateFormat = "LLLL"
        return dateForm.string(from: date)
    }
    
    func yearInitials(date: Date) -> String{
        let dateForm = DateFormatter()
        dateForm.dateFormat = "yyyy"
        return dateForm.string(from: date)
    }
    
    func daysInMonth(date: Date) -> Int
    {
        let range = calendar.range(of: .day, in: .month, for: date)!
        return range.count
    }
        
    func dayOfMonth(date: Date) -> Int
    {
        let components = calendar.dateComponents([.day], from: date)
        return components.day!
    }
    
    func firstOfMonth(date: Date) -> Date
    {
        let componenets = calendar.dateComponents([.year, .month], from: date)
        return calendar.date(from: componenets)!
        
    }
    
    func weekDay(date: Date) -> Int
    {
        let componenets = calendar.dateComponents([.weekday], from: date)
        return componenets.weekday! - 1
        
    }
}
