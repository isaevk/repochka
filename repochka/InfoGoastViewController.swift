//
//  InfoGoastViewController.swift
//  repochka
//
//  Created by Kirill Dev on 23.12.2022.
//

import UIKit

final class InfoGoastViewController: UIViewController {
    
    @IBOutlet private var nameTxtField: UITextField!
    @IBOutlet private var guestsTxtField: UITextField!
    @IBOutlet private var tableTxtField: UITextField!
    @IBOutlet private var bookedSwitch: UISwitch!
    @IBOutlet private var prepaySwitch: UISwitch!
    @IBOutlet private var vipSwitch: UISwitch!
    

    @IBAction func invoceButton(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let checkViewController = storyBoard.instantiateViewController(identifier: "checkView") as CheckViewController
        let alert = UIAlertController(title: "Bill it?", message: "", preferredStyle: .alert)
        let actionAlertYes = UIAlertAction(title: "Yes", style: .default) { [weak self] action  in
            guard let self = self else {return }
            self.navigationController?.pushViewController(checkViewController, animated: true)
            guard let name = self.nameTxtField.text else { return }
            checkViewController.checkInfo.name += name
            guard let guests = self.guestsTxtField.text else { return }
            checkViewController.checkInfo.guests += guests
            guard let table = self.tableTxtField.text else { return }
            checkViewController.checkInfo.table += table
            checkViewController.checkInfo.booked += (self.switchChange(param: (self.bookedSwitch)))
            checkViewController.checkInfo.prepay += (self.switchChange(param: (self.prepaySwitch)))
            checkViewController.checkInfo.vip += (self.switchChange(param: (self.vipSwitch)))
            
        }
        
        let actionAlertCancel = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(actionAlertYes)
        alert.addAction(actionAlertCancel)
        present(alert, animated: true, completion: nil)
        
    }
    func switchChange(param: UISwitch) -> String {
        var result = ""
        param.isOn ? (result = "Yes") : (result = "NO")
        return result
    }
    
    
}


