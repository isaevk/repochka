//
//  CheckViewController.swift
//  repochka
//
//  Created by Kirill Dev on 23.12.2022.
//

import UIKit

final class CheckViewController: UIViewController {
    
    @IBOutlet private var txtName: UILabel!
    
    @IBOutlet private var txtNum: UILabel!
    
    @IBOutlet private var txtTable: UILabel!
    
    @IBOutlet private var txtBooked: UILabel!
    
    @IBOutlet private var txtPrepay: UILabel!
    
    @IBOutlet private var txtVip: UILabel!
    

    var checkInfo = CheckInfo(name: "Full name: " , guests: "Number of guests: ", table: "Number of table: ", booked: "Booked? -  ", prepay: "Prepayment? - ", vip: "VIP room? - ")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtName.text = "\(checkInfo.name)"
        txtNum.text = "\(checkInfo.guests)"
        txtTable.text = "\(checkInfo.table)"
        txtBooked.text = "\(checkInfo.booked)"
        txtPrepay.text = "\(checkInfo.prepay)"
        txtVip.text = "\(checkInfo.vip)"
    }

    
    
    
}

