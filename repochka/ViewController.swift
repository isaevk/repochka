//
//  ViewController.swift
//  repochka
//
//  Created by Kirill Dev on 12.12.2022.
//

import UIKit

class ViewController: UIViewController {
    
  var rev = ReverseredWord()
    
    let button = UIButton()
    let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.frame = CGRect(x: 100, y: 300, width: 200, height: 80)
        button.backgroundColor = .red
        button.setTitle("START", for: .normal)
        button.addTarget(self, action: #selector(actionButton(_ :)), for: .touchUpInside)
        view.addSubview(button)
        
        label.frame = CGRect(x: 150, y: 200, width: 100, height: 50)
        label.text = "TEXT"
        label.textColor = .white
        label.backgroundColor = .blue
        view.addSubview(label)
    }
    
    @objc func actionButton(_ sender: Any) {
        let alert = UIAlertController(title: "Attention",
                                      message: "Type of word",
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default) { [self] (action) in
            let text = alert.textFields?.first
            self.label.text = rev.rev(word: (text?.text)!)
        }
        
        alert.addAction(action)
        alert.addTextField()
        present(alert, animated: true)
        
    }
}
