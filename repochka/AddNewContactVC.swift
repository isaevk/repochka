//
//  AddNewContactVC.swift
//  repochka
//
//  Created by Kirill Dev on 23.12.2022.
//

import UIKit

final class AddNewContactVC: UIViewController {
    
    private let age = Array(1...100)
    private let gender = ["Male", "Female"]
    
    private let logoNewContact = UIImageView()
    private let changePhotoImage = UIButton()
    private let nameLabel = UILabel()
    private let nameTxtField = UITextField()
    private let dateLabel = UILabel()
    private let dateTxtField = UITextField()
    private let agePicker = UIPickerView()
    private let ageLabel = UILabel()
    private let ageTxtField = UITextField()
    private let sexLabel = UILabel()
    private let sexTxtField = UITextField()
    private let sexPicker = UIPickerView()
    private let instagramLabel = UILabel()
    let instagramTxtField = UITextField()
    private let instagramAlert = UIAlertController()
    
    private lazy var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker(frame: .infinite)
        datePicker.datePickerMode = .date
        datePicker.timeZone = TimeZone.current
        datePicker.preferredDatePickerStyle = .wheels
        return datePicker
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewParameters()
    }
    
    private func setViewParameters() {
        view.backgroundColor = .white
        logoViewSetup()
        changePhotoButtonSetup()
        addContactButton()
        nameLabelNameTxtFieldSetup()
        dateLabelDateTxtFieldSetup()
        ageLabelAgeTxtFieldSetup()
        sexLabelSexTxtFieldSetup()
        instagramLabelInstagramTxtFieldSetup()
    }
    
    private func logoViewSetup() {
        logoNewContact.image = UIImage(named: "new-contact")
        logoNewContact.frame = CGRect(x: 140, y: 150, width: 100, height: 100)
        view.addSubview(logoNewContact)
    }
    
    private func changePhotoButtonSetup() {
        changePhotoImage.setTitle("Change photo", for: .normal)
        changePhotoImage.setTitleColor(.systemPink, for: .normal)
        changePhotoImage.frame = CGRect(x: 125, y: 255, width: 120, height: 20)
        view.addSubview(changePhotoImage)
    }
    
    // MARK: - Set Name
    private func nameLabelNameTxtFieldSetup() {
        nameLabel.text = "Name"
        nameLabel.textColor = .systemPink
        nameLabel.frame = CGRect(x: 30, y: 330, width: 50, height: 20)
        
        nameTxtField.placeholder = "Please enter name"
        nameTxtField.frame = CGRect(x: 30, y: 355, width: 300, height: 30)
        nameTxtField.addBottomBorder()
        [nameLabel, nameTxtField].forEach { view.addSubview($0) }
    }
    
    // MARK: - Set Date
    private func dateLabelDateTxtFieldSetup() {
        dateLabel.text = "Date"
        dateLabel.textColor = .systemPink
        dateLabel.frame = CGRect(x: 30, y: 400, width: 50, height: 20)
        
        dateTxtField.frame = CGRect(x: 30, y: 425, width: 300, height: 30)
        dateTxtField.placeholder = "Please select a date"
        dateTxtField.addBottomBorder()
        dateTxtField.inputView = datePicker
        datePicker.addTarget(self, action: #selector(handleDatePicker(sender:)), for: .valueChanged)
        [dateLabel, dateTxtField].forEach { view.addSubview($0) }
    }
    
    // MARK: - Set Age
    private func ageLabelAgeTxtFieldSetup() {
        ageLabel.text = "Age"
        ageLabel.textColor = .systemPink
        ageLabel.frame = CGRect(x:30 , y: 470, width: 50, height: 20)
        
        ageTxtField.placeholder = "Please select an age"
        ageTxtField.frame = CGRect(x: 30, y: 495, width: 300, height: 30)
        ageTxtField.addBottomBorder()
        ageTxtField.inputView = agePicker
        [ageTxtField, ageLabel].forEach { view.addSubview($0) }
        
        agePicker.delegate = self
        agePicker.dataSource = self
    }
    
    // MARK: - Set Sex
    private func sexLabelSexTxtFieldSetup() {
        sexLabel.text = "Sex"
        sexLabel.textColor = .systemPink
        sexLabel.frame = CGRect(x: 30, y: 540, width: 50, height: 20)
        
        sexTxtField.placeholder = "Please select sex"
        sexTxtField.frame = CGRect(x: 30, y: 565, width: 300, height: 30)
        sexTxtField.addBottomBorder()
        sexTxtField.inputView = sexPicker
        [sexLabel, sexTxtField].forEach { view.addSubview($0) }
        
        sexPicker.delegate = self
        sexPicker.dataSource = self
    }
    
    // MARK: - Set Inst
    private func instagramLabelInstagramTxtFieldSetup() {
        instagramLabel.text = "Instagram"
        instagramLabel.textColor = .systemPink
        instagramLabel.frame = CGRect(x: 30, y: 610, width: 80, height: 20)
        
        instagramTxtField.placeholder = "Add Instagram"
        instagramTxtField.frame = CGRect(x: 30, y: 635, width: 300, height: 30)
        instagramTxtField.addBottomBorder()
        instagramTxtField.addTarget(self, action: #selector(addInstagramAlert), for: .touchDown)
        [instagramLabel, instagramTxtField].forEach { view.addSubview($0) }
    }
    
    // MARK: - Add date in dateUITextField
    @objc private func handleDatePicker(sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        dateTxtField.text = dateFormatter.string(from: sender.date)
    }
    
    // MARK: - Add contact button + alert
    private func addContactButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(alertAddContactButton))
    }
    
    @objc private func alertAddContactButton() {
        presentAlert(withTitle: "Contact added", message: "")
    }
    
    // MARK: - Add Instagramm for inst text field
    @objc private func addInstagramAlert() {
        let saveText: (String?) -> () = { (textField: String?) in
            self.instagramTxtField.text = textField
        }
        instagramAlertShow(withTitle: "Enter username for Instagram", message: "", completion: saveText)
    }
}

// MARK: - UIPickerViewDataSource
extension AddNewContactVC: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView( _ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        var countrows: Int = age.count
        if pickerView == sexPicker {
            countrows = gender.count
        }
        return countrows
    }
    
    func pickerView( _ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == agePicker {
            let titleRow = String(age[row])
            return titleRow
        } else if pickerView == sexPicker {
            let titleRow = gender[row]
            return titleRow
        }
        return ""
    }
}

// MARK: - UIPickerViewDelegate
extension AddNewContactVC: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == agePicker {
            ageTxtField.text = String(age[row])
            ageTxtField.resignFirstResponder()
        } else if pickerView == sexPicker {
            sexTxtField.text = gender[row]
            sexTxtField.resignFirstResponder()
        }
    }
}
