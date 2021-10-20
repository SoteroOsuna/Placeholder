//
//  CrearSesionSeguimientoViewController.swift
//  CETACApp
//
//  Created by Sotero Osuna on 16/10/21.
//

import UIKit

class CrearSesionSeguimientoViewController: UIViewController {
    
    var sesionIniciada = false
    var usuario: Usuario?
    
    var sesionController = SesionController()

    @IBOutlet weak var nombreTanatologo: UITextField!
    @IBOutlet weak var nombreUsuario: UITextField!
    @IBOutlet weak var procedencia: UITextField!
    @IBOutlet weak var motivo: UITextField!
    @IBOutlet weak var tipoServicio: UITextField!
    @IBOutlet weak var tipoIntervencion: UITextField!
    @IBOutlet weak var herramienta: UITextField!
    @IBOutlet weak var evaluacion: UITextField!
    @IBOutlet weak var cuotaRecuperacion: UITextField!
    @IBOutlet weak var numeroSesion: UITextField!
    
    
    @IBAction func subirExpediente(_ sender: Any) {
        
        let sesionSeguimiento = SesionSeguimiento(numeroSesion: Int(numeroSesion.text!)!, nombreTanatologo: nombreTanatologo.text!, nombreUsuario: nombreUsuario.text!, motivo: motivo.text!, tipoServicio: tipoServicio.text!, tipoIntervencion: tipoIntervencion.text!, herramienta: herramienta.text!, evaluacion: evaluacion.text!, cuotaRecuperacion: Float(cuotaRecuperacion.text!)!)
        
        sesionController.insertSesionSeguimiento(sesion: sesionSeguimiento, completion: { (result) in
            switch result {
            case .success(_): self.navigationController?.popViewController(animated: true)
            case .failure(_): self.displayError(result as! Error, title: "No se pudo insertar")
            }
        })
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func displayError(_ error: Error, title: String) {
            DispatchQueue.main.async {
                let alert = UIAlertController(title: title, message: error.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
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
