//
//  DeleteScreenViewController.swift
//  CETACApp
//
//  Created by Juan Díaz on 19/10/21.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class DeleteScreenViewController: UIViewController, UITextFieldDelegate
{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
    
    @IBOutlet weak var userField: UITextField!
    @IBOutlet weak var namesField: UITextField!
    @IBOutlet weak var userType: UITextField!
    var elUsuario: Usuario?
    var userNameString: String!
    var userNameAdress: String!
    var userNameComplete: String!
    var userNamePassword: String!
    var userID: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userField.layer.borderWidth = 2.5
        namesField.layer.borderWidth = 2.5
        userType.layer.borderWidth = 2.5
        userField.layer.cornerRadius = 10
        namesField.layer.cornerRadius = 10
        userType.layer.cornerRadius = 10
        userField.layer.borderColor = UIColor.init(displayP3Red: 38/255, green: 47/255, blue: 109/255, alpha: 1).cgColor
        namesField.layer.borderColor = UIColor.init(displayP3Red: 38/255, green: 47/255, blue: 109/255, alpha: 1).cgColor
        userType.layer.borderColor = UIColor.init(displayP3Red: 38/255, green: 47/255, blue: 109/255, alpha: 1).cgColor
        userField.text = elUsuario!.usuario
        namesField.text = elUsuario!.nombre
        userType.text = elUsuario!.tipoUsuario
        userField.delegate = self
        namesField.delegate = self
        userType.delegate = self
        userField.isUserInteractionEnabled = false
        namesField.isUserInteractionEnabled = false
        userType.isUserInteractionEnabled = false
        userNamePassword = elUsuario!.password
        // Do any additional setup after loading the view.
    }
    
    @IBAction func deleteUser (_ sender: Any)
    {
        userNameString = userField.text!
        userNameAdress = "@cetacmobile.com"
        userNameComplete = userNameString + userNameAdress
       let deleteUser = "Usted ha eliminado al usuario: " + elUsuario!.usuario
        if userNameComplete != Auth.auth().currentUser?.email{     Auth.auth().signIn(withEmail: userNameComplete, password: userNamePassword) { (user, error) in
            if error == nil{
                let uid: String! = Auth.auth().currentUser!.uid
                let db = Firestore.firestore()
                let user = Auth.auth().currentUser
                user?.delete { error in
                  if let error = error {
                    // An error happened.
                  } else {
                      db.collection("Usuarios").document(uid).delete() { err in
                          if let err = err {
                              print("Error removing document: \(err)")
                          } else {
                              print("Document successfully removed!")
                          }
                          
                      }
                      let alertController = UIAlertController(title: "Actualización de Usuario", message: deleteUser, preferredStyle: .alert)
                      let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                       alertController.addAction(defaultAction)
                       self.present(alertController, animated: true, completion: nil)
                  }
                }
                }
            
            else {
             let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
             let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                            
              alertController.addAction(defaultAction)
              self.present(alertController, animated: true, completion: nil)
                 }
               }
           }
            else{
                let alertController = UIAlertController(title: "Error", message: "Usted no puede borarr su propia cuenta", preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                 alertController.addAction(defaultAction)
                 self.present(alertController, animated: true, completion: nil)
            }

    }

}
