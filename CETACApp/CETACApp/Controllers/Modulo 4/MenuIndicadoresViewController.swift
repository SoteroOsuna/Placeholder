//
//  MenuIndicadoresViewController.swift
//  CETACApp
//
//  Created by Sotero Osuna on 18/10/21.
//

import UIKit

class MenuIndicadoresViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
            if (user?.tipoUsuario == "Tanatólogo") {
                let title = "Denegado"
                let message = "Lo sentimos, no tienes permiso para entrar aquí"
                let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Regresar", style: .default, handler: { action in
                        self.performSegue(withIdentifier: "sinPermiso", sender: self)
                }))
                present(alert, animated: true)
            }
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
