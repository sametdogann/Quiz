

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    var quizBrain = QuizBrain ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        
        
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        //let actualAnswer = quiz[questionNumber].answer
        
        if userGotItRight  {
            // print("Right!")
            sender.backgroundColor = UIColor.green
        } else {
            //print("Wrong!")
            sender.backgroundColor = UIColor.red
            
        }
        
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
        } else {
            questionNumber = 0
        }
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: true)
        //updateUI()
    }
    
    @objc func updateUI () {
        
        questionLabel.text = quiz [questionNumber].text
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        progressBar.progress = Float(questionNumber + 1) / Float(quiz.count)
    }
    
}

