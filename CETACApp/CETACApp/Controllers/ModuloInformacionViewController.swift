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
    var indice = 0

    @IBOutlet weak var tituloInformacion: UILabel!
    
    @IBOutlet weak var descripcionInformacion: UITextView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        moduloInformacionController.fetchServicios{ (result) in
            switch result{
            case .success(let ModulosInformacionCETAC):self.updateUI(with: ModulosInformacionCETAC)
            case .failure(let error):self.displayError(error, title: "No se pudo acceder a los servicios")
            }
            
        }
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        moduloInformacionController.fetchServicios{ (result) in
            switch result{
            case .success(let ModulosInformacionCETAC):self.updateUI(with: ModulosInformacionCETAC)
            case .failure(let error):self.displayError(error, title: "No se pudo acceder a los servicios")
            }
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        moduloInformacionController.fetchServicios{ (result) in
            switch result{
            case .success(let ModulosInformacionCETAC):self.updateUI(with: ModulosInformacionCETAC)
            case .failure(let error):self.displayError(error, title: "No se pudo acceder a los servicios")
            }
            
        }
            // Put your code which should be executed with a delay here
            tituloInformacion.text = datos[indice].titulo
            print(datos[indice].titulo)
            descripcionInformacion.text = datos[indice].imagen
            print("xx")
            print(datos[indice].imagen)
            print("xx")
        
    }
    
    func updateUI(with informacion: ModulosInformacion){
        DispatchQueue.main.async {
            self.datos = informacion
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
