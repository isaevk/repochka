//
//  BirthdayVC.swift
//  repochka
//
//  Created by Kirill Dev on 23.12.2022.
//

import UIKit

final class BirthdayVC: UIViewController {
    
    private let firstImage = UIImageView()
    
    private let firstName = UILabel()
    
    private let firstDayAgo = UILabel()
    
    private let firstBirthInfo = UILabel()
    
    private let secondImage = UIImageView()
    
    private let secondName = UILabel()
    
    private let secondDayAgo = UILabel()
    
    private let secondBirthInfo = UILabel()
    
    private let thirdImage = UIImageView()
    
    private let thirdName = UILabel()
    
    private let thirdDayAgo = UILabel()
    
    private let thirdBirthInfo = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewParameters()
    }
    
    private func setViewParameters() {
        view.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .systemPink
        title = "Birthday"
        newContactItem()
        labelsImageFirstContactSetup()
        labelsImageSecondContactSetup()
        labelsImageThirdContactSetup()
    }
    
    // MARK: - first Contact
    private func labelsImageFirstContactSetup() {
        firstImage.image = UIImage(named: "contact")
        firstImage.frame = CGRect(x: 5, y: 130, width: 80, height: 80)
        
        firstName.text = "Jeremy"
        firstName.font = .boldSystemFont(ofSize: 20)
        firstName.frame = CGRect(x: 80, y: 140, width: 80, height: 20)
        
        firstBirthInfo.text = "March 10 will be 25 years old on Wed."
        firstBirthInfo.textColor = .systemGray
        firstBirthInfo.font = .systemFont(ofSize: 15)
        firstBirthInfo.frame = CGRect(x: 80, y: 175, width: 300, height: 20)
        
        firstDayAgo.text = "18 days"
        firstDayAgo.textColor = .systemGray
        firstDayAgo.frame = CGRect(x: 310, y: 140, width: 60, height: 20)
        [firstImage, firstName, firstBirthInfo, firstDayAgo].forEach { view.addSubview($0) }
    }
    
    // MARK: - second Contact
    private func labelsImageSecondContactSetup() {
        secondImage.image = UIImage(named: "contact")
        secondImage.frame = CGRect(x: 5, y: 240, width: 80, height: 80)
        
        secondName.text = "Maria Lui"
        secondName.font = .boldSystemFont(ofSize: 20)
        secondName.frame = CGRect(x: 80, y: 250, width: 100, height: 20)
        
        secondBirthInfo.text = "March 30 will be 20 years old on Thu."
        secondBirthInfo.textColor = .systemGray
        secondBirthInfo.font = .systemFont(ofSize: 15)
        secondBirthInfo.frame = CGRect(x: 80, y: 280, width: 300, height: 20)
        
        secondDayAgo.text = "28 days"
        secondDayAgo.textColor = .systemGray
        secondDayAgo.frame = CGRect(x: 310, y: 250, width: 70, height: 20)
        [secondImage, secondName, secondBirthInfo, secondDayAgo].forEach { view.addSubview($0) }
    }
    
    // MARK: - third Contact
    private func labelsImageThirdContactSetup() {
        thirdImage.image = UIImage(named: "contact")
        thirdImage.frame = CGRect(x: 5, y: 350, width: 80, height: 80)
        
        thirdName.text = "Jony Stark"
        thirdName.font = .boldSystemFont(ofSize: 20)
        thirdName.frame = CGRect(x: 80, y: 360, width: 100, height: 20)
        
        thirdBirthInfo.text = "April 20 will be 31 years old on Sat."
        thirdBirthInfo.textColor = .systemGray
        thirdBirthInfo.font = .systemFont(ofSize: 15)
        thirdBirthInfo.frame = CGRect(x: 80, y: 390, width: 300, height: 20)
        
        thirdDayAgo.text = "53 days"
        thirdDayAgo.textColor = .systemGray
        thirdDayAgo.frame = CGRect(x: 310, y: 360, width: 70, height: 20)
        [thirdImage, thirdName, thirdBirthInfo, thirdDayAgo].forEach { view.addSubview($0) }
    }
    
    // MARK: - Go to AddNewContactVC
    private func newContactItem() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addTapped))
    }
    
    @objc private func addTapped() {
        let vc = AddNewContactVC()
        navigationController?.pushViewController(vc, animated: true)
    }
}
