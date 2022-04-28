//
//  TimerViewController.swift
//  Nano Challenge 1
//
//  Created by Aria Rifqi on 27/04/22.
//

import UIKit

class TimerViewController: UIViewController {

    
    @IBOutlet weak var TimerLabel: UILabel!
    @IBOutlet weak var startStopBtn: UIButton!
    @IBOutlet weak var resetBtn: UIButton!
    
    var timer:Timer = Timer()
    var count:Int = 0
    var timerCounting:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //startStopBtn.setTitleColor(UIColor.green, for: .normal)
        
        
        startStopBtn.layer.shadowRadius = 4
        startStopBtn.layer.shadowOpacity = 0.3
        startStopBtn.layer.shadowOffset = CGSize(width: 2, height: 4)
        startStopBtn.layer.shadowColor = UIColor.black.cgColor
        
        resetBtn.layer.shadowRadius = 4
        resetBtn.layer.shadowOpacity = 0.1
        resetBtn.layer.shadowOffset = CGSize(width: 2, height: 4)
        resetBtn.layer.shadowColor = UIColor.black.cgColor
        resetBtn.layer.cornerRadius = 35
        resetBtn.layer.borderColor = UIColor.init(red: 58.0/255.0, green: 115.0/255.0, blue: 207.0/255.0, alpha: 1).cgColor
        resetBtn.layer.borderWidth = 2
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func startStopPrsd(_ sender: Any) {
        if(timerCounting)
        {
            timerCounting = false
            timer.invalidate()
            startStopBtn.setTitle("START", for: .normal)
            //startStopBtn.setTitleColor(UIColor.green, for: .normal)
            
        }
        else{
            timerCounting = true
            startStopBtn.setTitle("STOP", for: .normal)
            //startStopBtn.setTitleColor(UIColor.red, for: .normal)
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(plus), userInfo: nil, repeats: true)
        }
    }
    
    @objc func plus () -> Void
    {
        count = count + 1
        let time = secondsToHoursMinutesSeconds(seconds: count)
        let timeString = makeTimeString(hours: time.0, minutes: time.1, seconds: time.2)
        TimerLabel.text = timeString
    }
    
    func secondsToHoursMinutesSeconds(seconds:Int) -> (Int, Int, Int)
    {
        return ((seconds/3600, (seconds % 3600)/60, (seconds % 3600)%60))
    }
    
    func makeTimeString(hours:Int, minutes:Int, seconds: Int) -> String
    {
        var timeString = " "
        timeString += String(format: "%02d", hours)
        timeString += " : "
        timeString += String(format: "%02d", minutes)
        timeString += " : "
        timeString += String(format: "%02d", seconds)
        return timeString
    }

    @IBAction func resetPrsd(_ sender: Any) {
        let alert = UIAlertController(title: "Reset TImer?", message: "Do yo want to reset the timer?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "CANCEL", style: .cancel, handler: {
            (_)in //do not do anythin in this code to cancel
        }))
        alert.addAction(UIAlertAction(title: "YES", style: .default, handler: {
            (_)in
            self.count = 0
            self.timer.invalidate()
            self.TimerLabel.text = self.makeTimeString(hours: 0, minutes: 0, seconds: 0)
            self.startStopBtn.setTitle("START", for: .normal)
           // self.startStopBtn.setTitleColor(UIColor.green, for: .normal)
        }))
        self.present(alert, animated: true, completion: nil)
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
