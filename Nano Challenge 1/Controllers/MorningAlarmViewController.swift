//
//  MorningAlarmViewController.swift
//  Nano Challenge 1
//
//  Created by Aria Rifqi on 27/04/22.
//

import UIKit

class MorningAlarmViewController: UIViewController {

    
    @IBOutlet weak var playButton: UIButton!

    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var countdownLabel: UILabel!
    
    var timeRemaining: Int = 10
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        playButton.layer.shadowRadius = 4
        playButton.layer.shadowOpacity = 0.3
        playButton.layer.shadowOffset = CGSize(width: 2, height: 4)
        playButton.layer.shadowColor = UIColor.black.cgColor
        
        resetButton.layer.shadowRadius = 4
        resetButton.layer.shadowOpacity = 0.3
        resetButton.layer.shadowOffset = CGSize(width: 2, height: 4)
        resetButton.layer.shadowColor = UIColor.black.cgColor
        
        pauseButton.layer.shadowRadius = 4
        pauseButton.layer.shadowOpacity = 0.1
        pauseButton.layer.shadowOffset = CGSize(width: 2, height: 4)
        pauseButton.layer.shadowColor = UIColor.black.cgColor
        
        pauseButton.layer.cornerRadius = 35
        pauseButton.layer.borderColor = UIColor.init(red: 58.0/255.0, green: 115.0/255.0, blue: 207.0/255.0, alpha: 1).cgColor
        pauseButton.layer.borderWidth = 2
        
        
        // Do any additional setup after loading the view.
    }
    
   
    
    @objc func minus()
    {
        if timeRemaining > 0
        {
            timeRemaining -= 1
        }
        else
        {
            timer.invalidate()
            timeRemaining = 10
        }
        countdownLabel.text = "\(timeRemaining)"
    }
    
    @IBAction func playButton(_ sender: Any)
    {
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(minus), userInfo: nil, repeats: true)
        playButton.isHidden = true
    }
    
    
    @IBAction func pauseButton(_ sender: Any) {
        timer.invalidate()
        playButton.isHidden = false
    }
    
    
    @IBAction func resetButton(_ sender: Any) {
        timer.invalidate()
        timeRemaining = 0
        countdownLabel.text = "\(timeRemaining)"
        playButton.isHidden = false
    }
    
//    if timeRemaining = 0
//    {
//      
//
//    }
//
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
