//
//  CrearNuevaSesionViewController.swift
//  CETACApp
//
//  Created by Sotero Osuna on 16/10/21.
//

import UIKit

class CrearNuevaSesionViewController: UIViewController {
    
    var usuario: Usuario?
    
    var sesionController = SesionController()
    
    @IBOutlet weak var nombreTanatologo: UITextField!
    @IBOutlet weak var nombreUsuario: UITextField!
    @IBOutlet weak var ocupacion: UITextField!
    @IBOutlet weak var religion: UITextField!
    @IBOutlet weak var procedencia: UITextField!
    @IBOutlet weak var domicilio: UITextField!
    @IBOutlet weak var telefonoCasa: UITextField!
    @IBOutlet weak var estadoCivil: UITextField!
    @IBOutlet weak var edad: UITextField!
    @IBOutlet weak var sexo: UITextField!
    @IBOutlet weak var hijos: UITextField!
    @IBOutlet weak var referencia: UITextField!
    @IBOutlet weak var motivoConsulta: UITextField!
    @IBOutlet weak var identificacionEtapa: UITextField!
    @IBOutlet weak var motivo: UITextField!
    @IBOutlet weak var tipoServicio: UITextField!
    @IBOutlet weak var tipoIntervencion: UITextField!
    @IBOutlet weak var herramienta: UITextField!
    @IBOutlet weak var evaluacion: UITextField!
    @IBOutlet weak var cuotaRecuperacion: UITextField!
    
    @IBAction func subirExpediente(_ sender: Any) {
        let nuevaSesion = NuevaSesion(nombreTanatologo: nombreTanatologo.text!, nombreUsuario: nombreUsuario.text!, ocupacion: ocupacion.text!, religion: religion.text!, procedencia: procedencia.text!, domicilio: domicilio.text!, telefonoCasa: telefonoCasa.text!, estadoCivil: estadoCivil.text!, edad: Int(edad.text!)!, sexo: sexo.text!, hijos: hijos.text!, referencia: referencia.text!, motivoConsulta: motivoConsulta.text!, identificacionEtapa: identificacionEtapa.text!, motivo: motivo.text!, tipoServicio: tipoServicio.text!, tipoIntervencion: tipoIntervencion.text!, herramienta: herramienta.text!, evaluacion: evaluacion.text!, cuotaRecuperacion: Float(cuotaRecuperacion.text!)!)
        sesionController.insertNuevaSesion(sesion: nuevaSesion, completion: { (result) in
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
