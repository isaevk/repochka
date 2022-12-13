//
//  ViewController.swift
//  repochka
//
//  Created by Kirill Dev on 12.12.2022.
//

import UIKit

final class ViewController: UIViewController {
    
    let sayNameAllert = UIAlertController()
    let sumButton = UIButton()
    let guessNumberButton = UIButton()
    
    
    let nameLabel = UILabel()
    let resultSumLabel = UILabel()
    let guessNumberLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        
        nameAlert(title: "Hello!", message: "Type your name", style: .alert)
        
        sumButton.frame = CGRect(x: 90, y: 500, width: 100, height: 40)
        sumButton.setTitle("SUM", for: .normal)
        sumButton.backgroundColor = .black
        sumButton.addTarget(self, action: #selector(sumButtonAction(_ :)), for: .touchUpInside)
        view.addSubview(sumButton)
        
        guessNumberButton.frame =  CGRect(x: 210, y: 500, width: 100, height: 40)
        guessNumberButton.backgroundColor = .black
        guessNumberButton.setTitle("NUM", for: .normal)
        guessNumberButton.addTarget(self, action: #selector(numButtonAction(_ :)), for: .touchUpInside)
        view.addSubview(guessNumberButton)
        
        
        nameLabel.frame = CGRect(x: 100, y: 200, width: 200, height: 45)
        nameLabel.text = "Your name: "
        nameLabel.backgroundColor = .yellow
        view.addSubview(nameLabel)
        
        resultSumLabel.frame = CGRect(x: 100, y: 300, width: 200, height: 45)
        resultSumLabel.backgroundColor = .yellow
        view.addSubview(resultSumLabel)
        
        guessNumberLabel.frame = CGRect(x: 100, y: 400, width: 200, height: 45)
        guessNumberLabel.backgroundColor = .yellow
        view.addSubview(guessNumberLabel)
    }
    
    // MARK: - func sum button
    
    @objc func sumButtonAction(_ sender: Any) {
        self.resultSumLabel.text = "SUM: "
        let alertController = UIAlertController(title: "I can add up",
                                                message: "Enter two numbers",
                                                preferredStyle: .alert)
        let action = UIAlertAction(title: "Add up", style: .default) { action in
            let textFieldOne = Int(alertController.textFields?.first?.text ?? "not corect")
            let textFieldTwo = Int(alertController.textFields?.last?.text ?? "not corect")
            
            if textFieldOne != nil, textFieldTwo != nil {
                self.resultSumLabel.text = "SUM: \(String(textFieldOne! + textFieldTwo!))"
            } else {
                self.resultSumLabel.text = "SUM: "
            }
        }
        
        alertController.addTextField() { (textField) in
            textField.keyboardType = .numberPad
        }
        alertController.addTextField() { (textField) in
            textField.keyboardType = .numberPad
        }
        alertController.addAction(action)
        
        
        self.present(alertController, animated: true, completion: nil)
    }
    

    
    // MARK: - HI alert
    
    func nameAlert(title: String, message: String, style: UIAlertController.Style) {
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: style)
        let action = UIAlertAction(title: "Ok", style: .default) { (action) in
            let text = alertController.textFields?.first
            self.nameLabel.text! += (text?.text)!
        }
        
        alertController.addTextField()
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
    
    // MARK: - num button
    
    @objc func numButtonAction(_ sender: Any) {
        self.guessNumberLabel.text = "Guess?   "
        let number = Array(1...10).randomElement()
        let alertController = UIAlertController(title: "I guessed a number from 1 to 10",
                                                message: "Guess it",
                                                preferredStyle: .alert)
        let action = UIAlertAction(title: "Guess at", style: .default) { (action) in
            let text = alertController.textFields?.first
            
            if Int((text?.text)!) == nil {
                self.guessNumberLabel.text? += "Enter the number"
            }
            if number == Int((text?.text)!)  {
                self.guessNumberLabel.text? += "YES"
            } else {
                self.guessNumberLabel.text? += "NO"
            }
        }
        alertController.addTextField() { (textField) in
            textField.keyboardType = .numberPad
            
        }
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    
    
    
    
}
