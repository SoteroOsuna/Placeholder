//
//  ReporteSesionesTableViewController.swift
//  CETACApp
//
//  Created by Sotero Osuna on 16/10/21.
//

import UIKit

class ReporteSesionesTableViewController: UITableViewController {
    
    var sesionIniciada = false
    var usuario: Usuario?
    
    var sesionesControlador = SesionController()
    var datos = Sesiones()

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        sesionesControlador.fetchInformacion { (result) in
            switch result {
            case.success(let sesiones): self.updateUI(with: sesiones)
            case.failure(let error): self.displayError(error,title: "No se pudo retirar información")
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 140.0
        sesionesControlador.fetchInformacion { (result) in
            switch result {
            case.success(let sesiones): self.updateUI(with: sesiones)
            case.failure(let error): self.displayError(error,title: "No se pudo retirar información")
            }
        }
    }
    
    func updateUI(with sesiones: Sesiones) {
        DispatchQueue.main.async {
            self.datos = sesiones
            self.tableView.reloadData()
        }
    }
    func updateUI() {
        sesionesControlador.fetchInformacion { (result) in
            switch result {
            case.success(let sesiones): self.updateUI(with: sesiones)
            case.failure(let error): self.displayError(error,title: "No se pudo retirar información")
            }
        }
    }
    
    func displayError(_ error: Error, title: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: error.localizedDescription, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return datos.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celdaSesion", for: indexPath) as! SesionTableViewCell

        // Configure the cell...
        cell.update(with: datos[indexPath.row])

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let siguiente = segue.destination as! DetalleSesionViewController
        let indice = self.tableView.indexPathForSelectedRow?.row
        siguiente.sesion = datos[indice!]
    }

}
