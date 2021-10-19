//
//  DetalleUsuarioViewController.swift
//  CETACApp
//
//  Created by Sotero Osuna on 17/10/21.
//

import UIKit

class DetalleUsuarioViewController: UIViewController {
    
    var sesionIniciada = false
    var usuario: Usuario?
    
    @IBOutlet weak var ocupacion: UILabel!
    var primeraSesionUsuario: NuevaSesion?

    override func viewDidLoad() {
        super.viewDidLoad()

        ocupacion.text = primeraSesionUsuario?.ocupacion
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
