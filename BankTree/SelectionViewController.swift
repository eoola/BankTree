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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
