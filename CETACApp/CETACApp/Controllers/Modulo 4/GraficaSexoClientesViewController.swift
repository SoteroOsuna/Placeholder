//
//  GraficaSexoClientesViewController.swift
//  CETACApp
//
//  Created by Sotero Osuna on 18/10/21.
//

import UIKit
import Firebase
import Charts

class GraficaSexoClientesViewController: UIViewController {
    
    var sesionesControlador = SesionController()
    var datos = [NuevaSesion]()
    
    @IBOutlet weak var sesionesChart: BarChartView!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        sesionesControlador.fetchInformacionP { (result) in
            switch result {
                case.success(let sesiones): self.updateUI(with: sesiones)
                case.failure(let error): self.displayError(error,title: "No se pudo retirar información")
            }
        }
        sesionesChartsActualiza()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        sesionesChartsActualiza()
    }
    
    func sesionesChartsActualiza() {
        let punto1 = BarChartDataEntry(x:1, y: Double(datos.filter({$0.sexo == "Masculino"}).count))
        let punto2 = BarChartDataEntry(x:3, y: Double(datos.filter({$0.sexo == "Femenino"}).count))
        var sesionesArreglo = [BarChartDataEntry]()
        sesionesArreglo.append(punto1)
        sesionesArreglo.append(punto2)
        
        let colores = [UIColor.blue, UIColor.systemPink]
        
        let sesionesDataSet = BarChartDataSet(entries: sesionesArreglo, label: "Personas")
        sesionesDataSet.colors = colores
        let data = BarChartData(dataSet: sesionesDataSet)
        sesionesChart.data = data
        sesionesChart.notifyDataSetChanged()
        
    }
    
    func updateUI(with sesiones: [NuevaSesion]) {
        DispatchQueue.main.async {
            self.datos = sesiones
            self.sesionesChartsActualiza()
        }
    }
    func updateUI() {
        sesionesControlador.fetchInformacionP { (result) in
            switch result {
            case.success(let sesiones): self.updateUI(with: sesiones)
            case.failure(let error): self.displayError(error,title: "No se pudo retirar información")
            }
        }
        sesionesChartsActualiza()
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
