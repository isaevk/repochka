//
//  ViewController.swift
//  repochka
//
//  Created by Kirill Dev on 12.12.2022.
//

import UIKit

final class LogInVC: UIViewController {
    
    private let logImage = UIImageView()
    
    private let eyeButton = UIButton()
    
    private let singinLabel = UILabel()
    
    private let emailLabel = UILabel()
    
    private let passwordLabel = UILabel()
    
    private let faceIdLabel = UILabel()
    
    private let logLabel = UILabel()
    
    private let txtLogin = UITextField()
    
    private let txtPassword = UITextField()
    
    private let faceIdSwitch = UISwitch()
    
    private let singButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setViewParameters()
    }
    
   private func setViewParameters() {
        logoImage()
        logoLabel()
        singLabel()
        mailLabel()
        txtFieldMail()
        passWordLabel()
        txtFieldPassword()
        faceIDLabel()
        faceIDSwitch()
        singInButton()
        eyeImageView()
    }
    
    private func logoImage() {
        logImage.layer.borderWidth = 1
        logImage.layer.borderColor = UIColor.black.cgColor
        logImage.image = UIImage(named: "Birthday_Logo")
        logImage.contentMode = .scaleAspectFit
        logImage.frame = CGRect(x: 140, y: 150, width: 100, height: 100)
        view.addSubview(logImage)
    }
    
    private func logoLabel() {
        logLabel.text = "Birthday Reminder"
        logLabel.textColor = .systemPink
        logLabel.frame = CGRect(x: 120, y: 250, width: 150, height: 50)
        view.addSubview(logLabel)
    }
    
    private func singLabel() {
        singinLabel.text = "Sing in"
        singinLabel.font = .boldSystemFont(ofSize: 30)
        singinLabel.frame = CGRect(x: 50, y: 320, width: 100, height: 50)
        view.addSubview(singinLabel)
    }
    
    private func mailLabel() {
        emailLabel.text = "email"
        emailLabel.textColor = .systemPink
        emailLabel.frame = CGRect(x: 50, y: 365, width: 80, height: 40)
        view.addSubview(emailLabel)
    }
    
    private func txtFieldMail() {
        txtLogin.placeholder = "please enter your e-mail"
        txtLogin.borderStyle = .roundedRect
        txtLogin.frame = CGRect(x: 50, y: 405, width: 280, height: 40)
        txtLogin.keyboardType = .emailAddress
        view.addSubview(txtLogin)
    }
    
    private func passWordLabel() {
        passwordLabel.text = "password"
        passwordLabel.textColor = .systemPink
        passwordLabel.frame = CGRect(x: 50, y: 435, width: 80, height: 40)
        view.addSubview(passwordLabel)
    }
    
    private func txtFieldPassword() {
        txtPassword.placeholder = "please enter your password"
        txtPassword.borderStyle = .roundedRect
        txtPassword.frame = CGRect(x: 50, y: 475, width: 280, height: 40)
        txtPassword.isSecureTextEntry = true
        view.addSubview(txtPassword)
    }
    
    private func faceIDLabel() {
        faceIdLabel.text = "Face ID login"
        faceIdLabel.font = .boldSystemFont(ofSize: 15)
        faceIdLabel.frame = CGRect(x: 170, y: 520, width: 120, height: 50)
        view.addSubview(faceIdLabel)
    }
    
    private func faceIDSwitch() {
        faceIdSwitch.frame = CGRect(x: 275, y: 530, width: 0, height: 0)
        view.addSubview(faceIdSwitch)
    }
    
    private func singInButton() {
        singButton.frame = CGRect(x: 50, y: 600, width: 280, height: 50)
        singButton.backgroundColor = .systemPink
        singButton.setTitle("Sing in", for: .normal)
        singButton.addTarget(self, action: #selector(pressButtonSing), for: .touchUpInside)
        view.addSubview(singButton)
    }
    
    // MARK: - Eye for password field
    private func eyeImageView() {
        eyeButton.setImage(UIImage(named: "open-eye"), for: .normal)
        eyeButton.setImage(UIImage(named: "closed-eye"), for: .selected)
        eyeButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: -12, bottom: 0, right: 0)
        eyeButton.addTarget(self, action: #selector(togglePasswordView), for: .touchUpInside)
        txtPassword.rightView = eyeButton
        txtPassword.rightViewMode = .always
        eyeButton.alpha = 0.3
    }
    
    @objc func togglePasswordView(_ sender: Any) {
        txtPassword.isSecureTextEntry.toggle()
        eyeButton.isSelected.toggle()
    }
    
    //MARK: - Check text field.count
    @objc private func pressButtonSing() {
        guard txtLogin.text?.count != 0 else {
            presentAlert(withTitle: "Sorry", message: "Please enter your e-mail")
            return
        }
        guard txtPassword.text?.count != 0 else {
            presentAlert(withTitle: "Sorry", message: "Please enter your password")
            return
        }
        let vc = BirthdayVC()
        navigationController?.pushViewController(vc, animated: true)
    }
}









