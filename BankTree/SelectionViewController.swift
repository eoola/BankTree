//
//  SelectionViewController.swift
//  BankTree
//
//  Created by Tareq Mia on 8/12/21.
//

import UIKit

class SelectionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func startQuiz(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "quiz") as! QuizViewController
        //vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
        
    }
    
    @IBAction func unwindFromQuizToSelection (unwindSegue: UIStoryboardSegue) {
        
    }
    

}
