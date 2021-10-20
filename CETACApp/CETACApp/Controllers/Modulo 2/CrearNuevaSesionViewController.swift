//
//  CrearNuevaSesionViewController.swift
//  CETACApp
//
//  Created by Sotero Osuna on 16/10/21.
//

import UIKit

class CrearNuevaSesionViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource, UITextViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    var usuario: Usuario?
    var pickerViewMotivo = UIPickerView()
    var pickerViewServicio = UIPickerView()
    var pickerViewIntervencion = UIPickerView()
    var pickerViewHerramienta = UIPickerView()
    var pickerViewSexos = UIPickerView()
    var pickerViewCivil = UIPickerView()
    var sesionController = SesionController()
    let pickerMotivos = listaMotivos
    let pickerServicios = listaServicios
    let pickerIntervencion = listaIntervencion
    let pickerHerramienta = listaHerramienta
    let pickerSexos = listaSexos
    let pickerCivil = listaEstadoCivil
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
    @IBOutlet weak var motivoConsulta: UITextView!
    @IBOutlet weak var identificacionEtapa: UITextField!
    @IBOutlet weak var motivo: UITextField!
    @IBOutlet weak var tipoServicio: UITextField!
    @IBOutlet weak var tipoIntervencion: UITextField!
    @IBOutlet weak var herramienta: UITextField!
    @IBOutlet weak var evaluacion: UITextView!
    @IBOutlet weak var cuotaRecuperacion: UITextField!
    
    
    @IBAction func tapEnVista(_ sender: Any) {
        self.view.endEditing(true)
    }
    
    
    @IBAction func subirExpediente(_ sender: Any) {
        let nuevaSesion = NuevaSesion(nombreTanatologo: nombreTanatologo.text!, nombreUsuario: nombreUsuario.text!, ocupacion: ocupacion.text!, religion: religion.text!, procedencia: procedencia.text!, domicilio: domicilio.text!, telefonoCasa: telefonoCasa.text!, estadoCivil: estadoCivil.text!, edad: Int(edad.text!)!, sexo: sexo.text!, hijos: hijos.text!, referencia: referencia.text!, motivoConsulta: motivoConsulta.text!, identificacionEtapa: identificacionEtapa.text!, motivo: motivo.text!, tipoServicio: tipoServicio.text!, tipoIntervencion: tipoIntervencion.text!, herramienta: herramienta.text!, evaluacion: evaluacion.text!, cuotaRecuperacion: Float(cuotaRecuperacion.text!)!)
        sesionController.insertNuevaSesion(sesion: nuevaSesion, completion: { (result) in
            switch result {
            case .success(_): self.navigationController?.popViewController(animated: true)
            case .failure(_): self.displayError(result as! Error, title: "No se pudo insertar")
            }
        })
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        motivo.inputView = pickerViewMotivo
        tipoServicio.inputView = pickerViewServicio
        tipoIntervencion.inputView = pickerViewIntervencion
        herramienta.inputView = pickerViewHerramienta
        sexo.inputView = pickerViewSexos
        estadoCivil.inputView = pickerViewCivil
        pickerViewCivil.delegate = self
        pickerViewCivil.dataSource = self
        pickerViewSexos.delegate = self
        pickerViewSexos.dataSource = self
        pickerViewMotivo.delegate = self
        pickerViewMotivo.dataSource = self
        pickerViewServicio.delegate = self
        pickerViewServicio.dataSource = self
        pickerViewIntervencion.delegate = self
        pickerViewIntervencion.dataSource = self
        pickerViewHerramienta.delegate = self
        pickerViewHerramienta.dataSource = self
        if (Global.usuario?.tipoUsuario == "Tanatólogo") {
            nombreTanatologo.text = Global.usuario?.nombre
            nombreTanatologo.isEnabled = false
        }
        
        nombreTanatologo.delegate = self
        nombreUsuario.delegate = self
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
        motivoConsulta.delegate = self
        identificacionEtapa.delegate = self
        motivo.delegate = self
        tipoServicio.delegate = self
        tipoIntervencion.delegate = self
        herramienta.delegate = self
        evaluacion.delegate = self
        cuotaRecuperacion.delegate = self
        registerForKeyboardNotifications()
        
    }
    func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWasShown(_:)), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBeHidden(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc func keyboardWasShown(_ notification: NSNotification) {
        guard let info = notification.userInfo,
            let keyboardFrameValue = info[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue else { return }

        let keyboardFrame = keyboardFrameValue.cgRectValue
        let keyboardSize = keyboardFrame.size

        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height + 115, right: 0.0)
        scrollView.contentInset = contentInsets
    }

    @objc func keyboardWillBeHidden(_ notification: NSNotification) {
        let contentInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInsets
    }
    
    public func numberOfComponents(in pickerView: UIPickerView)-> Int
    {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int)-> Int
    {
        var row:Int = 0
        if (pickerView == pickerViewMotivo)
        {
            row = pickerMotivos.count
        }
        
        else if (pickerView == pickerViewServicio)
        {
            row = pickerServicios.count
        }
        
        else if (pickerView == pickerViewIntervencion)
        {
            row = pickerIntervencion.count
        }
        
        else if (pickerView == pickerViewHerramienta)
        {
            row = pickerHerramienta.count
        }
        else if (pickerView == pickerViewSexos)
        {
            row = pickerSexos.count
        }
        else if (pickerView == pickerViewCivil)
        {
            row = pickerCivil.count
        }
        return row
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int)-> String?
    {
        var stringPick: String = ""
        if (pickerView == pickerViewMotivo)
        {
            stringPick = pickerMotivos[row]
        }
        
        else if (pickerView == pickerViewServicio)
        {
            stringPick = pickerServicios[row]
        }
        
        else if (pickerView == pickerViewIntervencion)
        {
            stringPick = pickerIntervencion[row]
        }
        
        else if (pickerView == pickerViewHerramienta)
        {
            stringPick = pickerHerramienta[row]
        }
        else if (pickerView == pickerViewSexos)
        {
            stringPick = pickerSexos[row]
        }
        else if (pickerView == pickerViewCivil)
        {
            stringPick = pickerCivil[row]
        }
        return stringPick
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        if (pickerView == pickerViewMotivo)
        {
            motivo.text = pickerMotivos[row]
            motivo.resignFirstResponder()

        }
        
        else if (pickerView == pickerViewServicio)
        {
            tipoServicio.text = pickerServicios[row]
            tipoServicio.resignFirstResponder()

        }
        
        else if (pickerView == pickerViewIntervencion)
        {
            tipoIntervencion.text = pickerIntervencion[row]
            tipoIntervencion.resignFirstResponder()

        }
        
        else if (pickerView == pickerViewHerramienta)
        {
            herramienta.text = pickerHerramienta[row]
            herramienta.resignFirstResponder()
        }
        else if (pickerView == pickerViewSexos)
        {
            sexo.text = pickerSexos[row]
            sexo.resignFirstResponder()
        }
        else if (pickerView == pickerViewCivil)
        {
            estadoCivil.text = pickerCivil[row]
            estadoCivil.resignFirstResponder()
        }
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
