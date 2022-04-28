//
//  OpeningViewController.swift
//  Nano Challenge 1
//
//  Created by Aria Rifqi on 26/04/22.
//

import UIKit

class OpeningViewController: UIViewController {

    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var buttonNightLabel: UIButton!
    @IBOutlet weak var buttonMorningLabel: UIButton!
    
    let months:[String] = ["Jan", "Feb", "March", "April", "May", "June", "July", "Aug", "Sept", "Oct", "Nov", "Dec"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonNightLabel.layer.shadowRadius = 4
        buttonNightLabel.layer.shadowOpacity = 0.3
        buttonNightLabel.layer.shadowOffset = CGSize(width: 2, height: 4)
        buttonNightLabel.layer.shadowColor = UIColor.black.cgColor
        
        buttonMorningLabel.layer.shadowRadius = 4
        buttonMorningLabel.layer.shadowOpacity = 0.3
        buttonMorningLabel.layer.shadowOffset = CGSize(width: 2, height: 4)
        buttonMorningLabel.layer.shadowColor = UIColor.black.cgColor
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true)
        {
            (_) in
            let date = Date()
            let dateFormatter = DateFormatter()
            
            //Format of our Time
            dateFormatter.dateFormat = "hh:mm:ss a"
            let currentTime = dateFormatter.string(from: date)
            
            //Format of my Month
            dateFormatter.dateFormat = "dd-M-yyyy"
            //let currentMonth = dateFormatter.string(from: date)
            
            let calender = Calendar.current
            let day = calender.component(.day, from: date)
            let month = calender.component(.month, from: date)
            let year = calender.component(.year, from: date)
            
            let monthString = self.months[month - 1]
            
            var dayString = String(day)
            
            let lastChar = dayString.last!
            
        if lastChar == "1"
            {
            dayString = dayString + "st of"
        }
        else if lastChar == "2"
            {
            dayString = dayString + "nd of"
        }
        else if lastChar == "3"
            {
            dayString = dayString + "rd of"
        }
        else
            {
        dayString = dayString + "th of"
        }
            
            let currentMonth = "\(dayString) \(monthString), \(year)"
          
            
            self.timeLabel.text = currentTime
            self.dateLabel.text = currentMonth
        }

        // Do any additional setup after loading the view.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
