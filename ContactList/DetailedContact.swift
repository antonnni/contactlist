//
//  DetailedContact.swift
//  ContactList
//
//  Created by Anton Ni on 11/11/23.
//


import UIKit

class DetailedContact: UIViewController {

    @IBOutlet weak var labelPhone: UILabel!
    @IBOutlet weak var labelLastname: UILabel!
    @IBOutlet weak var labelName: UILabel!
    
    var contact123 = Contact()
   
    override func viewDidLoad() {
    
        super.viewDidLoad()
        
        labelName?.text = contact123.name
        labelLastname?.text = contact123.lastName
        labelPhone?.text = contact123.phoneNumber
        
        
        
    }
    
}
