//
//  StopwatchWithLappingViewController.swift
//  Nano Challenge 1
//
//  Created by Aria Rifqi on 28/04/22.
//

import UIKit


class StopwatchWithLappingViewController: UIViewController {

  
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var secLabel: UILabel!
    @IBOutlet weak var minLabel: UILabel!
    @IBOutlet weak var hourLabel: UILabel!
    
    @IBOutlet weak var pauseBtn: UIButton!
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var resetBtn: UIButton!
    @IBOutlet weak var lapBtn: UIButton!
    
    var hours = 0
    var minutes = 0
    var seconds = 0
    
    var lappedtimes:[String] = ["1", "2", "3"]
    
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playBtn.layer.shadowRadius = 4
        playBtn.layer.shadowOpacity = 0.3
        playBtn.layer.shadowOffset = CGSize(width: 2, height: 4)
        playBtn.layer.shadowColor = UIColor.black.cgColor
        
        pauseBtn.layer.shadowRadius = 4
        pauseBtn.layer.shadowOpacity = 0.1
        pauseBtn.layer.shadowOffset = CGSize(width: 2, height: 4)
        pauseBtn.layer.shadowColor = UIColor.black.cgColor
        pauseBtn.layer.cornerRadius = 35
        pauseBtn.layer.borderColor = UIColor.init(red: 58.0/255.0, green: 115.0/255.0, blue: 207.0/255.0, alpha: 1).cgColor
        pauseBtn.layer.borderWidth = 2
        
        resetBtn.layer.shadowRadius = 4
        resetBtn.layer.shadowOpacity = 0.3
        resetBtn.layer.shadowOffset = CGSize(width: 2, height: 4)
        resetBtn.layer.shadowColor = UIColor.black.cgColor
        
        lapBtn.layer.shadowRadius = 4
        lapBtn.layer.shadowOpacity = 0.1
        lapBtn.layer.shadowOffset = CGSize(width: 2, height: 4)
        lapBtn.layer.shadowColor = UIColor.black.cgColor
        lapBtn.layer.cornerRadius = 35
        lapBtn.layer.borderColor = UIColor.init(red: 58.0/255.0, green: 115.0/255.0, blue: 207.0/255.0, alpha: 1).cgColor
        lapBtn.layer.borderWidth = 2
        

        // Do any additional setup after loading the view.
    }
    

    @IBAction func playButton(_ sender: UIButton) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(count), userInfo: nil, repeats: true)
        playBtn.isHidden = true
    }
    @objc fileprivate func count(){
    seconds += 1
        if seconds == 60
        {
            minutes += 1
            seconds = 0
        }
        
        if minutes == 60
        {
            minutes = 0
            seconds = 0
            hours += 1
        }
        if hours == 24
        {
            timer.invalidate()
        }
        secLabel.text = "%02d\(seconds)"
        minLabel.text = minutes == 0 ? "%02d\(minutes)" : "0\(minutes)"
        hourLabel.text = hours == 0 ? "00" : "%02d\(hours)"
        
    }
    
    func resetTimer()
    {
        seconds = 0
        minutes = 0
        hours = 0
        timer.invalidate()
        secLabel.text = "00"
        minLabel.text = "00"
        hourLabel.text = "00"
    }
    
    @IBAction func resetButton(_ sender: Any) {
        resetTimer()
    }
    
    @IBAction func pauseButton(_ sender: Any) {
        timer.invalidate()
        playBtn.isHidden = false
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
extension ViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "lapCell", for: indexPath)
        cell.textLabel?.text = "Aria Ganteng \(indexPath.row + 1)"
        return cell
    }
    
}
