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

    var sesionIniciada = Global.sesionIniciada
    var usuario = Global.usuario
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (!sesionIniciada) {
    
            let title = "Inicio de Sesión"
            let message = "Para acceder a esta función, inicie sesión"
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Iniciar Sesión", style: .default, handler: { action in
                    self.performSegue(withIdentifier: "irALogin", sender: self)
                
            }))
            present(alert, animated: true)
        }

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        if (!sesionIniciada) {
    
            let title = "Inicio de Sesión"
            let message = "Para acceder a esta función, inicie sesión"
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Iniciar Sesión", style: .default, handler: { action in
                    self.performSegue(withIdentifier: "irALogin", sender: self)
                
            }))
            present(alert, animated: true)
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