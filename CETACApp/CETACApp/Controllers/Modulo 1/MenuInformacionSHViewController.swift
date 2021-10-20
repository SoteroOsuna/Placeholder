//
//  MenuInformacionSHViewController.swift
//  CETACApp
//
//  Created by Sotero Osuna on 11/10/21.
//

import UIKit

class MenuInformacionSHViewController: UIViewController {

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
        
        case "aromaterapia":
            siguiente.indice = 12
        case "cristaloterapia":
            siguiente.indice = 13
        case "reiki":
            siguiente.indice = 14
        case "biomagnetismo":
            siguiente.indice = 15
        case "angeloterapia":
            siguiente.indice = 16
        case "musicoterapia":
            siguiente.indice = 17
        default:
            siguiente.indice = 18
        }
        siguiente.limiteInferior = 12
        siguiente.limiteSuperior = 18
        
    }

}
