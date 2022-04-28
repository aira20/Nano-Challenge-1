//
//  MathProblemViewController.swift
//  Nano Challenge 1
//
//  Created by Aria Rifqi on 28/04/22.
//

import UIKit
import SwiftUI


class MathProblemViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

     
        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet weak var secondNumberLabel: UILabel!
    @IBOutlet weak var firstNumberLabel: UILabel!
    
    struct ContentView: View
    {
        @State private var correctAnswer = 0
        @State private var choiceArray : [Int] = [0, 1, 2, 3]
        @State private var firstNumber = 0
        @State private var secondNumber = 0
        @State private var maxNumber = 1000
        @State private var score = 0
        
        var body: some View
        {
            Text("Hello, World")
                .padding()
        }
        
        func answerCorrect(answer: Int)
        {
            let isCorrect = answer == correctAnswer ? true : false
            
            if isCorrect
            {
                self.score += 1
            }
            else{
                self.score -= 1
            }
        }
        func generateAnswers()
        {
            firstNumber = Int.random(in: 0...(maxNumber/2))
            secondNumber = Int.random(in: 0...(maxNumber/2))
            
            var answerList = [Int]()
            
            correctAnswer = firstNumber + secondNumber
            
            for _ in 0 ... 2
            {
                answerList.append(Int.random(in: 0...maxNumber))
            }
            
            answerList.append(correctAnswer)
            
            choiceArray = answerList.shuffled()
        }
        
       
        
        
    }
    
    struct ContentView_Previews: PreviewProvider
    {
        static var previews: some View{
            ContentView()
        }
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
