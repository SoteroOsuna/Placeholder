//
//  LogInViewController.swift
//  CETACApp
//
//  Created by Sotero Osuna on 10/10/21.
//

import UIKit
import Firebase
import FirebaseAuth

class LogInViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var buttonSignIn: UIButton!
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
    
    
    @IBAction func secureText(_ sender: Any) {
        password.isSecureTextEntry = !password.isSecureTextEntry
    }
    
    
    @IBAction func loginAction(_ sender: Any) {
        let userNameString = userName.text!
        let userNameAdress = "@cetacmobile.com"
        let userNameComplete = userNameString + userNameAdress
        Auth.auth().signIn(withEmail: userNameComplete, password: password.text!) { (user, error) in
            if error == nil{
                let db = Firestore.firestore()
                let usernameIDAccess: String! = Auth.auth().currentUser!.uid
                let docRef = db.collection("Usuarios").document(usernameIDAccess)
                docRef.getDocument { (document, error) in
                    if let document = document, document.exists {
                            Global.usuario = Usuario(aDoc: document)
                        }
                }
                let alertController = UIAlertController(title: "Inicio de Sesión", message: "Usted ha iniciado sesión", preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: { _ in
                    self.navigationController?.popViewController(animated: true)
                })
                 alertController.addAction(defaultAction)
                self.present(alertController, animated: true, completion: nil)
            }
            
            else {
                let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                            
                alertController.addAction(defaultAction)
                self.present(alertController, animated: true, completion: nil)
            }
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        userName.layer.borderColor = UIColor.init(displayP3Red: 38/255, green: 47/255, blue: 109/255, alpha: 1).cgColor
        password.layer.borderColor = UIColor.init(displayP3Red: 38/255, green: 47/255, blue: 109/255, alpha: 1).cgColor
        userName.layer.borderWidth = 2.5
        password.layer.borderWidth = 2.5
        userName.layer.cornerRadius = 10
        password.layer.cornerRadius = 10
        buttonSignIn.layer.cornerRadius = 22
        userName.delegate = self
        password.delegate = self
        
        
        
        // Do any additional setup after loading the view.
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }

}
