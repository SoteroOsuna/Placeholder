//
//  MenuInformacionCETACViewController.swift
//  CETACApp
//
//  Created by Sotero Osuna on 02/10/21.
//

import UIKit

class MenuInformacionCETACViewController: UIViewController {

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
        
        case "mision":
            siguiente.indice = 0
        case "vision":
            siguiente.indice = 1
        case "valores":
            siguiente.indice = 2
        default:
            siguiente.indice = 0
        }
    }

}
