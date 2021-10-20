//
//  CrearNuevaSesionViewController.swift
//  CETACApp
//
//  Created by Sotero Osuna on 16/10/21.
//

import UIKit

class CrearNuevaSesionViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource, UITextViewDelegate {
    
    
    var usuario: Usuario?
    var pickerViewMotivo = UIPickerView()
    var pickerViewServicio = UIPickerView()
    var pickerViewIntervencion = UIPickerView()
    var pickerViewHerramienta = UIPickerView()
    var sesionController = SesionController()
    let pickerMotivos = listaMotivos
    let pickerServicios = listaServicios
    let pickerIntervencion = listaIntervencion
    let pickerHerramienta = listaHerramienta
    
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
        motivo.inputView = pickerViewMotivo
        tipoServicio.inputView = pickerViewServicio
        tipoIntervencion.inputView = pickerViewIntervencion
        herramienta.inputView = pickerViewHerramienta
        pickerViewMotivo.delegate = self
        pickerViewMotivo.dataSource = self
        pickerViewServicio.delegate = self
        pickerViewServicio.dataSource = self
        pickerViewIntervencion.delegate = self
        pickerViewIntervencion.dataSource = self
        pickerViewHerramienta.delegate = self
        pickerViewHerramienta.dataSource = self
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
