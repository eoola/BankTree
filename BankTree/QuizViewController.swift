//
//  QuizViewController.swift
//  BankTree
//
//  Created by Tareq Mia on 8/12/21.
//

import UIKit

class QuizViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   

    @IBOutlet var tableView: UITableView!
    @IBOutlet var label: UILabel!
    
    var quizModels = [QuizQuestion]()
    var currentQuesiton: QuizQuestion?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpQuestions()
        tableView.delegate = self
        tableView.dataSource = self
        configureUI(question: quizModels.first!)
        
    }
    
    
    
    
    private func configureUI(question: QuizQuestion){
        label.text = question.text
        currentQuesiton = question
        tableView.reloadData()
        
        
    }
    
    private func checkAnswer(answer: Answer, question: QuizQuestion) -> Bool {
        return question.answers.contains(where: {$0.text == answer.text }) && answer.isCorrect
    }
    
    private func setUpQuestions() {
        quizModels.append(QuizQuestion(text: "What is 2 + 2?",
                                       answers: [Answer(text: "1", isCorrect: false),
                                                 Answer(text: "2", isCorrect: false),
                                                 Answer(text: "4", isCorrect: true),
                                                 Answer(text: "5", isCorrect: false)]))
        quizModels.append(QuizQuestion(text: "What is 2 + 0?",
                                       answers: [Answer(text: "1", isCorrect: false),
                                                 Answer(text: "2", isCorrect: true),
                                                 Answer(text: "4", isCorrect: false),
                                                 Answer(text: "5", isCorrect: false)]))
        quizModels.append(QuizQuestion(text: "What is 2 + 3?",
                                       answers: [Answer(text: "1", isCorrect: false),
                                                 Answer(text: "2", isCorrect: false),
                                                 Answer(text: "4", isCorrect: false),
                                                 Answer(text: "5", isCorrect: true)]))
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentQuesiton?.answers.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = currentQuesiton?.answers[indexPath.row].text
        return  cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let question = currentQuesiton else {
            return
        }
        let answer = question.answers[indexPath.row]
        
        if checkAnswer(answer: answer, question: question) {
            //next question
            if  let index = quizModels.firstIndex(where: { $0.text == question.text }) {
                if index < quizModels.count - 1 {
                    //next question
                    let nextQuestion = quizModels[index + 1]
                    configureUI(question: nextQuestion)
                }
                else{
                    //end of game
                    let alert = UIAlertController(title: "Done", message: "Quiz Completed", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
                    present(alert, animated: true)
                    
                }
            }
        } else {
            //alert
            
            let alert = UIAlertController(title: "Incorrect", message: "Try Again", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
            present(alert, animated: true)
        }
    }
    

    
}


struct QuizQuestion {
    let text: String
    let answers: [Answer]
}

struct Answer {
    let text: String
    let isCorrect: Bool
}

