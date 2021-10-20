//
//  EncuadreUsuarioViewController.swift
//  CETACApp
//
//  Created by Sotero Osuna on 19/10/21.
//

import UIKit


class EncuadreUsuarioViewController: UIViewController,UITextFieldDelegate {
    
    var sesionesController = SesionController()
    var sesionEncuadre:NuevaSesion?
    
    
    @IBAction func tapEnVista(_ sender: Any) {
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
    
    @IBOutlet weak var nombre: UILabel!
    @IBOutlet weak var ocupacion: UITextField!
    @IBOutlet weak var religion: UITextField!
    @IBOutlet weak var procedencia: UITextField!
    @IBOutlet weak var domicilio: UITextField!
    @IBOutlet weak var telefonoCasa: UITextField!
    @IBOutlet weak var estadoCivil: UITextField!
    @IBOutlet weak var edad: UITextField!
    @IBOutlet weak var sexo: UITextField!
    @IBOutlet weak var hijos: UITextField!
    @IBOutlet weak var motivoConsulta: UITextView!
    @IBOutlet weak var referencia: UITextField!
    @IBOutlet weak var identificacionEtapa: UITextField!
    @IBOutlet weak var actualizarBoton: UIButton!
    @IBAction func actualizarExpediente(_ sender: Any) {
        let nuevaSesion = NuevaSesion(id: sesionEncuadre!.id, nombreTanatologo: sesionEncuadre!.nombreTanatologo, nombreUsuario: sesionEncuadre!.nombreUsuario, ocupacion: ocupacion.text!, religion: religion.text!, procedencia: procedencia.text!, domicilio: domicilio.text!, telefonoCasa: telefonoCasa.text!, estadoCivil: estadoCivil.text!, edad: Int(edad.text!)!, sexo: sexo.text!, hijos: hijos.text!, referencia: referencia.text!, motivoConsulta: motivoConsulta.text!, identificacionEtapa: identificacionEtapa.text!, motivo: sesionEncuadre!.motivo, tipoServicio: sesionEncuadre!.tipoServicio, tipoIntervencion: sesionEncuadre!.tipoIntervencion, herramienta: sesionEncuadre!.herramienta, evaluacion: sesionEncuadre!.evaluacion, cuotaRecuperacion: sesionEncuadre!.cuotaRecuperacion)
        
        sesionesController.updateNuevaSesion(updateSesion: nuevaSesion, completion: { (result) in
            switch result {
            case .success(_): self.navigationController?.popToRootViewController(animated: true)
            case .failure(_): self.displayError(result as! Error, title: "No se pudo actualizar")
            }
        })
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nombre.layer.borderColor = UIColor.init(displayP3Red: 38/255, green: 47/255, blue: 109/255, alpha: 1).cgColor
        nombre.layer.borderWidth = 2.5
        nombre.layer.cornerRadius = 10
        
        nombre.text = sesionEncuadre!.nombreUsuario
        ocupacion.text = sesionEncuadre!.ocupacion
        religion.text = sesionEncuadre!.religion
        procedencia.text = sesionEncuadre!.procedencia
        domicilio.text = sesionEncuadre!.domicilio
        telefonoCasa.text = sesionEncuadre!.telefonoCasa
        estadoCivil.text = sesionEncuadre!.estadoCivil
        edad.text = String(sesionEncuadre!.edad)
        sexo.text = sesionEncuadre!.sexo
        hijos.text = sesionEncuadre!.hijos
        referencia.text = sesionEncuadre!.referencia
        motivoConsulta.text = sesionEncuadre!.motivoConsulta
        identificacionEtapa.text = sesionEncuadre!.identificacionEtapa
        
        // Do any additional setup after loading the view.
        if (Global.usuario?.tipoUsuario != "Admin") {
            nombre.isEnabled = false
            ocupacion.isEnabled = false
            religion.isEnabled = false
            procedencia.isEnabled = false
            domicilio.isEnabled = false
            telefonoCasa.isEnabled = false
            estadoCivil.isEnabled = false
            edad.isEnabled = false
            sexo.isEnabled = false
            hijos.isEnabled = false
            referencia.isEnabled = false
            identificacionEtapa.isEnabled = false
            actualizarBoton.isEnabled = false
            motivoConsulta.isEditable = false
            actualizarBoton.isHidden = true
        }
        ocupacion.delegate = self
        religion.delegate = self
        procedencia.delegate = self
        domicilio.delegate = self
        telefonoCasa.delegate = self
        estadoCivil.delegate = self
        edad.delegate = self
        sexo.delegate = self
        hijos.delegate = self
        referencia.delegate = self
        identificacionEtapa.delegate = self
        
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
