//
//  ViewController.swift
//  Project-Lab2
//
//  Created by Yehyaelhelou on 31/10/2022.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var ScoreLabel: UILabel!
    @IBOutlet weak var imageQuestion: UIImageView!
    @IBOutlet weak var answerResult: UIImageView!
    
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    @IBOutlet weak var answer4: UIButton!
    
    var quiz  = Quiz()
    var isActive  = true

    override func viewDidLoad() {
        super.viewDidLoad()
        loadQuestion()
    }
    
    func loadQuestion(){
        let currentQuestion = quiz.currentQuestion

        let choices = quiz.choices[currentQuestion].shuffled()
        let score = quiz.score
        let image = quiz.images[currentQuestion]
        
        answer1.setTitle(choices[0], for: .normal)
        answer2.setTitle(choices[1], for: UIControl.State.normal)
        answer3.setTitle(choices[2], for: UIControl.State.normal)
        answer4.setTitle(choices[3], for: UIControl.State.normal)
        imageQuestion.image = image
        
        ScoreLabel.text  = "Your score \(score)"
        
    }
    
    @IBAction func answerSelected(_ sender: UIButton) {
        if quiz.checkAnswer(answer: sender.currentTitle ?? "s") == true{
            answerResult.image = UIImage(named: "true")
        }else{
            answerResult.image = UIImage(named: "false")
        }
            quiz.nextQuestion()
            loadQuestion()
        }
    }


    struct Quiz {
        let images = [UIImage(named: "Egypt") , UIImage(named: "Indonesia") , UIImage(contentsOfFile: "UAE")]
        
        let choices = [["Egypt","palestine","Frence" , "Italy"],["Indonisa","Italy","Malit" , "UAE"],["UAE","Qatar","Frence" , "sweed"]]
        
        var currentQuestion = 0
        var score = 0
        var isActive = true
    
        mutating func checkAnswer(answer:String)->Bool{
            if answer == choices[currentQuestion][0] &&  isActive{
                score += 1
                return true
            }else{
                return false
            }
        }
        
        mutating func nextQuestion(){
            if currentQuestion >= images.count - 1 {
                print("game over")
                isActive = false
            }else{
                currentQuestion += 1
            }
        }
        
        
        
    }
    


