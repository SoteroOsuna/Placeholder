//
//  DetalleSesionViewController.swift
//  CETACApp
//
//  Created by Sotero Osuna on 17/10/21.
//

import UIKit

class DetalleSesionViewController: UIViewController {
    
    var sesionController = SesionController()
    var sesion: Sesion?
    
    @IBOutlet weak var nombreUsuario: UILabel!
    @IBOutlet weak var nombreTanatologo: UILabel!
    @IBOutlet weak var motivo: UILabel!
    @IBOutlet weak var tipoServicio: UILabel!
    @IBOutlet weak var tipoIntervencion: UILabel!
    @IBOutlet weak var herramienta: UILabel!
    @IBOutlet weak var evaluacion: UILabel!
    @IBOutlet weak var cuotaRecuperacion: UILabel!
    
    @IBAction func borrarSesion(_ sender: Any) {
        sesionController.deleteSesion(sesionID: sesion!.id, completion: { (result) in
            switch result {
            case .success(_): self.navigationController?.popViewController(animated: true)
            case .failure(_): self.displayError(result as! Error, title: "No se pudo insertar")
            }
        })
    }
    @IBOutlet weak var verInformacion: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nombreUsuario.text = "Nombre de Usuario: " + self.sesion!.nombreUsuario
        nombreTanatologo.text = "Nombre de Tanatólogo: " + self.sesion!.nombreTanatologo
        motivo.text = "Motivo: " + self.sesion!.motivo
        tipoServicio.text = "Tipo de Servicio: " + self.sesion!.tipoServicio
        tipoIntervencion.text = "Tipo de Intervención" + self.sesion!.tipoIntervencion
        herramienta.text = "Herramienta: " + self.sesion!.herramienta
        evaluacion.text = "Evaluación: " + self.sesion!.evaluacion
        cuotaRecuperacion.text = "Cuota de Recuperación: " + String(self.sesion!.cuotaRecuperacion)
        if (sesion?.numeroSesion != 1) {
            verInformacion.isEnabled = false
            verInformacion.isHidden = true
        }
        // Do any additional setup after loading the view.
    }
    
    func displayError(_ error: Error, title: String) {
            DispatchQueue.main.async {
                let alert = UIAlertController(title: title, message: error.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let siguiente = segue.destination as! EncuadreUsuarioViewController
        let nuevaSesion = sesion as? NuevaSesion
        siguiente.sesionEncuadre = nuevaSesion
    }
}
