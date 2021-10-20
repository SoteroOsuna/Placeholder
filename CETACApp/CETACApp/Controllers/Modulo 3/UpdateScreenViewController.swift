//
//  UpdateScreenViewController.swift
//  CETACApp
//
//  Created by Juan Díaz on 19/10/21.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class UpdateScreenViewController: UIViewController, UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    @IBOutlet weak var namesField: UITextField!
    @IBOutlet weak var userType: UITextField!
    var elUsuario: Usuario?
    var pickerView = UIPickerView()
    let userTypes = listaUsuarios
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        namesField.layer.borderWidth = 2.5
        userType.layer.borderWidth = 2.5
        namesField.layer.cornerRadius = 10
        userType.layer.cornerRadius = 10
        namesField.layer.borderColor = UIColor.init(displayP3Red: 38/255, green: 47/255, blue: 109/255, alpha: 1).cgColor
        userType.layer.borderColor = UIColor.init(displayP3Red: 38/255, green: 47/255, blue: 109/255, alpha: 1).cgColor
        userType.inputView = pickerView
        namesField.text = elUsuario!.nombre
        userType.text = elUsuario!.tipoUsuario
        namesField.delegate = self
        userType.delegate = self
        pickerView.dataSource = self
        pickerView.delegate = self
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
    
    @IBAction func actualizarUsuario (_ seder: Any)
    {
            let pilaNombre = namesField.text!
            let tipoUsuario = userType.text!
            let updateUser = "Usted ha actualizado al usuario: " + elUsuario!.usuario
            let db = Firestore.firestore()
            let uid: String! = elUsuario?.id
            db.collection("Usuarios").document(uid).updateData([
                "Nombre(s)": pilaNombre,
                "Tipo de Usuario": tipoUsuario,])
            let alertController = UIAlertController(title: "Actualización de Usuario", message: updateUser, preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
             alertController.addAction(defaultAction)
             self.present(alertController, animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
