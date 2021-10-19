//
//  MenuInformacionSAViewController.swift
//  CETACApp
//
//  Created by Sotero Osuna on 11/10/21.
//

import UIKit

class MenuInformacionSAViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let siguiente = segue.destination as! ModuloInformacionViewController
        switch segue.identifier {
        
        case "tanatologia":
            siguiente.indice = 10
        case "acompanamientoIndividual":
            siguiente.indice = 11
        case "acompanamientoGrupal":
            siguiente.indice = 12
        case "logoterapia":
            siguiente.indice = 13
        default:
            siguiente.indice = 14
        }
        
        siguiente.limiteInferior = 10
        siguiente.limiteSuperior = 14
    }

}
