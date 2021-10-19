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
    
    @IBAction func cerrarSesion(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            self.performSegue(withIdentifier: "irALogin", sender: self)
        } catch _ {
            print("ERROR SIGNING OUT")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
