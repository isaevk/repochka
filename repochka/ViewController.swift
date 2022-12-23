//
//  ViewController.swift
//  repochka
//
//  Created by Kirill Dev on 12.12.2022.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet private var textEmail: UITextField!
    @IBOutlet private var textPassword: UITextField!
    @IBOutlet private var eyeButton: UIImageView!
    @IBOutlet private var warningLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createEyeTapRecognizer()
    }
    
    @IBAction func singButton(_ sender: Any) {
        guard textEmail.text?.count != 0 else {
            warningLabel.text = "Please enter email"
            return
        }
        guard textPassword.text?.count != 0 else {
            warningLabel.text = "Please enter password"
            return
        }
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let infoGoustVC = storyboard.instantiateViewController(identifier: "infoGoust") as? InfoGoastViewController else { return }
        warningLabel.isHidden = true
        show(infoGoustVC, sender: nil)
    }
    
    func createEyeTapRecognizer() {
        eyeButton.image = UIImage(named: "eye_open.png")
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        eyeButton.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        if eyeButton.image == UIImage(named: "eye_open.png") {
            eyeButton.image = UIImage(named: "eye_closed.png")
        } else {
            eyeButton.image = UIImage(named: "eye_open.pnge")
        }
        textPassword.isSecureTextEntry = !textPassword.isSecureTextEntry
    }
}

