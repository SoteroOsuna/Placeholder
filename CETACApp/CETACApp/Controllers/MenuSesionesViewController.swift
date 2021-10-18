//
//  MenuSesionesViewController.swift
//  CETACApp
//
//  Created by Sotero Osuna on 11/10/21.
//

import UIKit

class MenuSesionesViewController: UIViewController {
    
    var sesionIniciada = false
    var usuario: Usuario?

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
        
        if (!sesionIniciada) {
            
        }
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }

}
