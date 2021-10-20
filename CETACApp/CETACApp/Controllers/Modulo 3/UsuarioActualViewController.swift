//
//  UsuarioActualViewController.swift
//  CETACApp
//
//  Created by Sotero Osuna on 18/10/21.
//

import UIKit
import Firebase
import FirebaseAuth

class UsuarioActualViewController: UIViewController {
    
    @IBOutlet weak var usuario: UILabel!
    @IBOutlet weak var tipoUsuario: UILabel!
    @IBOutlet weak var nombre: UILabel!
    @IBOutlet weak var resume: UILabel!
    @IBOutlet weak var createUserButton: UIButton!
    @IBOutlet weak var updateUserButton: UIButton!
    @IBOutlet weak var deleteUserButton: UIButton!
    
    @IBAction func cerrarSesion(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            Global.usuario = nil
            self.performSegue(withIdentifier: "irALogin", sender: self)
        } catch _ {
            print("ERROR SIGNING OUT")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usuario.layer.borderColor = UIColor.init(displayP3Red: 38/255, green: 47/255, blue: 109/255, alpha: 1).cgColor
        tipoUsuario.layer.borderColor = UIColor.init(displayP3Red: 38/255, green: 47/255, blue: 109/255, alpha: 1).cgColor
        nombre.layer.borderColor = UIColor.init(displayP3Red: 38/255, green: 47/255, blue: 109/255, alpha: 1).cgColor
        resume.layer.borderColor = UIColor.init(displayP3Red: 38/255, green: 47/255, blue: 109/255, alpha: 1).cgColor
        usuario.layer.borderWidth = 2.5
        resume.layer.borderWidth = 2.5
        tipoUsuario.layer.borderWidth = 2.5
        nombre.layer.borderWidth = 2.5
        usuario.layer.cornerRadius = 10
        resume.layer.cornerRadius = 10
        tipoUsuario.layer.cornerRadius = 10
        nombre.layer.cornerRadius = 10
        
        if (Global.usuario?.tipoUsuario != "Admin")
        {
            createUserButton.isHidden = true
            updateUserButton.isHidden = true
            deleteUserButton.isHidden = true
        }
        else if (Global.usuario?.tipoUsuario == "Admin")
        {
            createUserButton.isHidden = false
            updateUserButton.isHidden = false
            deleteUserButton.isHidden = false
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        let user = Global.usuario
        if (user == nil) {
            let title = "Inicio de Sesión"
            let message = "Para acceder a esta función, inicie sesión "
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Iniciar Sesión", style: .default, handler: { action in
                    self.performSegue(withIdentifier: "irALogin", sender: self)
                
            }))
            present(alert, animated: true)

        } else {
            usuario.text = Global.usuario?.usuario
            tipoUsuario.text = Global.usuario?.tipoUsuario
            nombre.text = Global.usuario?.nombre
        }
        if (Global.usuario?.tipoUsuario != "Admin")
        {
            createUserButton.isHidden = true
            updateUserButton.isHidden = true
            deleteUserButton.isHidden = true
        }
        else if (Global.usuario?.tipoUsuario == "Admin")
        {
            createUserButton.isHidden = false
            updateUserButton.isHidden = false
            deleteUserButton.isHidden = false
        }
        
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
