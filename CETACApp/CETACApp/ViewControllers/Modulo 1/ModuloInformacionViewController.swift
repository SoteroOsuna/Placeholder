//
//  ModuloInformacionViewController.swift
//  CETACApp
//
//  Created by Sotero Osuna on 30/09/21.
//

import UIKit

class ModuloInformacionViewController: UIViewController {

    var moduloInformacionController = ModuloInformacionController()
    var datos = [ModuloInformacion]()
    var limiteInferior = 0
    var limiteSuperior = 100
    var indice = 0

    @IBOutlet weak var tituloInformacion: UILabel!
    
    @IBOutlet weak var descripcionInformacion: UITextView!
    
    @IBOutlet weak var imagenInformacion: UIImageView!
    
    @IBAction func botonSiguiente(_ sender: Any) {
        if (indice == limiteSuperior) {
            indice = limiteInferior
        } else {
            indice += 1
        }
        updateUI(with: datos)
    }
    @IBAction func swipeDerecha(_ sender: Any) {
        if (self.indice == self.limiteSuperior) {
            self.indice = self.limiteInferior
        } else {
            self.indice += 1
        }
        updateUI(with: datos)
    }
    
    @IBAction func botonAnterior(_ sender: Any) {
        if (indice == limiteInferior) {
            indice = limiteSuperior
        } else {
            indice -= 1
        }
        updateUI(with: datos)
    }
    @IBAction func swipeIzquierda(_ sender: Any) {
        if (indice == limiteInferior) {
            indice = limiteSuperior
        } else {
            indice -= 1
        }
        updateUI(with: datos)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        moduloInformacionController.fetchInformacion { (result) in
            switch result{
            case .success(let ModulosInformacionCETAC):self.updateUI(with: ModulosInformacionCETAC)
            case .failure(let error):self.displayError(error, title: "No se pudo acceder a los servicios")
            }
            
        }
        
    }
    
    func updateUI(with informacion: ModulosInformacion) {
        DispatchQueue.main.async {
            
            self.datos = informacion
            self.tituloInformacion.text = self.datos[self.indice].titulo
            self.imagenInformacion.image = UIImage(named: self.datos[self.indice].imagen)
            self.descripcionInformacion.text = self.datos[self.indice].descripcion
        }
    }
    
    func displayError(_ error: Error, title: String) {
            DispatchQueue.main.async {
                let alert = UIAlertController(title: title, message: error.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
    }
    func displayExito(title: String, detalle:String) {
            DispatchQueue.main.async {
                let alert = UIAlertController(title: title, message: detalle, preferredStyle: .alert)
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
