//
//  MenuSesionesViewController.swift
//  CETACApp
//
//  Created by Sotero Osuna on 11/10/21.
//

import UIKit
import Firebase
import FirebaseAuth


class MenuSesionesViewController: UIViewController {

    @IBAction func botonNuevaSesion(_ sender: Any) {
        decidirTipoSesion()
    }
    func decidirTipoSesion() {
        let title = "Tipo de Sesion"
        let message = "¿Será una nueva sesión o una sesión de seguimiento?"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Nueva Sesión", style: .default, handler: { action in
                self.performSegue(withIdentifier: "nuevaSesion", sender: self)
            
        }))
        alert.addAction(UIAlertAction(title: "Seguimiento", style: .default, handler: { action in
               self.performSegue(withIdentifier: "sesionSeguimiento", sender: self)
        }))
                        
        present(alert, animated: true)
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

        }
        
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }

}
