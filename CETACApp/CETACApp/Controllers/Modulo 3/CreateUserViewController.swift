//
//  CreateUserViewController.swift
//  CETACApp
//
//  Created by Juan Díaz on 20/10/21.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseFirestore

class CreateUserViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var userNameNew: UITextField!
    @IBOutlet weak var nombreUsuario: UITextField!
    @IBOutlet weak var userType: UITextField!
    @IBOutlet weak var passwordNew: UITextField!
    @IBOutlet weak var passButton: UIButton!
    var pickerView = UIPickerView()
    let userTypes = listaUsuarios
    var userNameNewString: String!
    var userNameNewAdress: String!
    var userNameNewComplete: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nombreUsuario.layer.borderWidth = 2.5
        userNameNew.layer.borderWidth = 2.5
        passwordNew.layer.borderWidth = 2.5
        userType.layer.borderWidth = 2.5
        nombreUsuario.layer.cornerRadius = 10
        userNameNew.layer.cornerRadius = 10
        passwordNew.layer.cornerRadius = 10
        userType.layer.cornerRadius = 10
        nombreUsuario.layer.borderColor = UIColor.init(displayP3Red: 38/255, green: 47/255, blue: 109/255, alpha: 1).cgColor
        userNameNew.layer.borderColor = UIColor.init(displayP3Red: 38/255, green: 47/255, blue: 109/255, alpha: 1).cgColor
        passwordNew.layer.borderColor = UIColor.init(displayP3Red: 38/255, green: 47/255, blue: 109/255, alpha: 1).cgColor
        userType.layer.borderColor = UIColor.init(displayP3Red: 38/255, green: 47/255, blue: 109/255, alpha: 1).cgColor
        userType.inputView = pickerView
        nombreUsuario.delegate = self
        userNameNew.delegate = self
        passwordNew.delegate = self
        userType.delegate = self
        pickerView.delegate = self
        pickerView.dataSource = self

        // Do any additional setup after loading the view.
    }
    public func numberOfComponents(in pickerView: UIPickerView)-> Int
    {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int)-> Int
    {
        return userTypes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int)-> String?
    {
        return userTypes[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        userType.text = userTypes[row]
        userType.resignFirstResponder()
    }
    
    @IBAction func iconAction(_ sender: Any) {
        passwordNew.isSecureTextEntry = !passwordNew.isSecureTextEntry
    }
    
    @IBAction func CreateUser(_ sender: Any) {
        let db = Firestore.firestore()
        var passWordFirst: String!
       let currentAdmin: String! = Auth.auth().currentUser!.email
        let docRefFirst = db.collection("Usuarios").document(Auth.auth().currentUser!.uid)
        docRefFirst.getDocument { (document, error) in
            if let document = document, document.exists {
              passWordFirst = document.get("Contraseña") as! String
            }
        }
        userNameNewString = userNameNew.text!
        userNameNewAdress = "@cetacmobile.com"
        let pilaNombre = nombreUsuario.text!
        let usuarioN = userNameNew.text!.lowercased()
        let contrasenha = passwordNew.text!
        let tipoUsuario = userType.text!
        userNameNewComplete = userNameNewString + userNameNewAdress
        Auth.auth().createUser(withEmail: userNameNewComplete, password: passwordNew.text!) { authResult, error in
            if error == nil{
                let uid: String! = Auth.auth().currentUser!.uid
                let ref = db.collection("Usuarios").document(uid).setData([
                    "Nombre(s)": pilaNombre,
                    "Usuario": usuarioN,
                    "Contraseña": contrasenha,
                    "Tipo de Usuario": tipoUsuario,
                ])
                Auth.auth().signIn(withEmail: currentAdmin, password: passWordFirst)
            }
        else
        {
         let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
         let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
          alertController.addAction(defaultAction)
          self.present(alertController, animated: true, completion: nil)
             }
        }
        nombreUsuario.text = ""
        userNameNew.text = ""
        passwordNew.text = ""
        userType.text = ""
        /*let emailNNN: String! = Auth.auth().currentUser!.email
        userNameNew.placeholder = "El usuario es: " + emailNNN*/
            }
    
    
}
