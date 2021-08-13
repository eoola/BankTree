//
//  ArticleDetailViewController.swift
//  BankTree
//
//  Created by Emmanuel Ola on 8/13/21.
//

import UIKit

class ArticleDetailViewController: UIViewController {
    
    let articleTitle: String
    
    init?(_ coder: NSCoder, title: String) {
        self.articleTitle = title
        super.init(coder: coder)!
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = articleTitle
        // Do any additional setup after loading the view.
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
