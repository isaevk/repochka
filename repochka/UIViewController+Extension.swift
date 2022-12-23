//
//  UIViewController+Extension.swift
//  repochka
//
//  Created by Kirill Dev on 23.12.2022.
//

import UIKit

extension UIViewController {
    
    func presentAlert(withTitle title: String, message : String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let actionOk = UIAlertAction(title: "Ok", style: .default)
        alertController.addAction(actionOk)
        present(alertController, animated: true)
    }
    
    func instagramAlertShow(withTitle title: String, message : String, completion: @escaping (String?) -> ()) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let actionCancel = UIAlertAction(title: "Cancel", style: .cancel)
        let actionOk = UIAlertAction(title: "Ok", style: .default) { _ -> Void in
            let textField = alertController.textFields![0] as UITextField
            completion(textField.text)
        }
        alertController.addTextField() { textField in
            textField.placeholder = "For example @alina_vetrova"
        }
        alertController.addAction(actionCancel)
        alertController.addAction(actionOk)
        present(alertController, animated: true)
    }
}
