//
//  ViewController.swift
//  BierhdayNoteTaker
//
//  Created by Ali serkan Boyracı  on 3.09.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var nameText: UITextField!
    @IBOutlet var birthdayText: UITextField!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var birthdayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //açılır açılmaz eski verileri görmek için.
        
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        // alttaki forkeyler ile aynı olmalı.
        
        
        //nameLabel.text = storedName bu şekilde yazamazsın casting yaplamloyız as?-as! şeklinde ama en mantıklısı if let kullanımı.
        
        if let newName = storedName as? String {
            nameLabel.text = "Name: \(newName)"
        }
        if let newBirthday = storedBirthday as? String {
            birthdayLabel.text = "Birthday: \(newBirthday)"
        }       
    }

    @IBAction func saveButton(_ sender: Any) {
        
        //sadece key-value şeklinde az bilgi kaydedebilmek için Userdefaults kullanılır.
        UserDefaults.standard.set(nameText.text!, forKey: "name") //forkey daha sonra çağırabilmek için kullanılır.
        UserDefaults.standard.set(birthdayText.text!, forKey: "birthday")
        
        //UserDefaults.standard.synchronize() eskiden kullanılırdı artık gerek yok başka yerlerde görenilirisin.
        
        
        nameLabel.text = "Name: \(nameText.text!)"
        birthdayLabel.text = "Birthday: \(birthdayText.text!)"
    }
    
    @IBAction func deleteButton(_ sender: Any) {
        
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        /*bu şekilde de yazılabilir.
        if let newName = storedName as? String {
            UserDefaults.standard.removeObject(forKey: "name")
        }
        
        if let newBirthday = storedBirthday as? String {
            UserDefaults.standard.removeObject(forKey: "name")
        }
        */
        
        
        //aşağıda 2 farklı kullanım yaptım ikisi de aynı oluyor.
        if (storedName as? String) != nil {
            UserDefaults.standard.removeObject(forKey: "name")
            nameLabel.text = "Name: "
        }
        
        //aşağıda 2 farklı kullanım yaptım ikisi de aynı oluyor.
        if storedBirthday is String {
            UserDefaults.standard.removeObject(forKey: "name")
            birthdayLabel.text = "Birthday: "
        }
    }
}
// acaba kac key, value kaydedilebilir.
// burda 1 tane denemistik.


