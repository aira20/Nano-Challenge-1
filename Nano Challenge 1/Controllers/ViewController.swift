//
//  ViewController.swift
//  Nano Challenge 1
//
//  Created by Aria Rifqi on 26/04/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextButton.layer.shadowRadius = 4
        nextButton.layer.shadowOpacity = 0.3
        nextButton.layer.shadowOffset = CGSize(width: 2, height: 4)
        nextButton.layer.shadowColor = UIColor.black.cgColor
        nextButton.layer.cornerRadius = 35
        // Do any additional setup after loading the view.
    }


}

