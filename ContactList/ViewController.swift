//
//  ViewController.swift
//  ContactList
//
//  Created by Anton Ni on 06/11/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelLastname: UILabel!
    @IBOutlet weak var labelPhone: UILabel!
    
    
    @IBOutlet weak var textfieldname: UITextField!
    @IBOutlet weak var textfieldlastname: UITextField!
    @IBOutlet weak var textfieldphone: UITextField!
    
    
    var contact123 = Contact()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelName?.text = contact123.name
        labelLastname?.text = contact123.lastName
        labelPhone?.text = contact123.phoneNumber

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func addcontact(_ sender: Any) {
        
        //обращаемся к пространству которое по ключевому слову будет сохранять значения
        let defaults = UserDefaults.standard
        
        let addName = textfieldname.text!
        let addLastName = textfieldlastname.text!
        let addPhone = textfieldphone.text!
        
        var addContact = Contact()
        addContact.name = addName
        addContact.lastName = addLastName
        addContact.phoneNumber = addPhone
        //обращаемся к пространству которое по ключевому слову сохраняет значение (для простых данных)
        do {
            if let data = defaults.data(forKey: "ContactArray") {
                var array = try JSONDecoder().decode([Contact].self, from: data)
                
                array.append(addContact)
                
                let encodedata = try JSONEncoder().encode(array)
                
                defaults.set(encodedata, forKey: "ContactArray")
            } else {
            
                let encodedata = try JSONEncoder().encode([addContact])
                
                defaults.set(encodedata, forKey: "ContactArray")
            
            }
            
        } catch {
            print("unable to encode \(error)")
        }
        
        textfieldname.text = ""
        textfieldphone.text = ""
        textfieldlastname.text = ""
        
        
    }
    

}

