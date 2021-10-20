
//
//  UsuariosDeleteTableViewController.swift
//  CETACApp
//
//  Created by Juan Díaz on 19/10/21.
//

import UIKit

class UsuariosDeleteTableViewController: UITableViewController {
    
    var usuarioControlador = UsuarioController()
    var datos = [Usuario]()
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usuarioControlador.fetchInformacion{(result) in
            switch result{
            case .success(let usuarios):self.updateUI(with: usuarios)
            case .failure(let error):self.displayError(error, title: "No se pudo acceder a los usuarios")
            }
        }
        
    }
    func updateUI(with usuarios: Usuarios){
        DispatchQueue.main.async {
            self.datos = usuarios
            self.tableView.reloadData()
        }
    }
    
    func displayError(_ error: Error, title: String){
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
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return datos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "usuarioCellDel", for: indexPath) as! UsuarioDelTableViewCell
        
        // Configure the cell...
//        cell.textLabel?.text = datos[indexPath.row].nombre
        cell.update(with: datos[indexPath.row])
        return cell
    }
    
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "deleteUser"{
            let siguiente = segue.destination as! DeleteScreenViewController
            let indice = self.tableView.indexPathForSelectedRow?.row
            siguiente.elUsuario = datos[indice!]
        }
    }

}
