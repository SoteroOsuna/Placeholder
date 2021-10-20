//
//  IntervencionViewController.swift
//  Pods
//
//  Created by Juan Díaz on 20/10/21.
//

import UIKit
import Firebase
import Charts

class IntervencionViewController: UIViewController {
    @IBOutlet weak var PieChart: PieChartView!
    
    var sesionControlador = SesionController()
    var indicadores = Sesiones()
    var sexo:String = ""
    var sexos = [String]()
    var sexosLabels = listaIntervencion
    var counts = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    var sexosLabels2 = [String]()
    var counts2 = [Double]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sesionControlador.fetchInformacion{(result) in
            switch result{
            case .success(let sesiones):self.updateUI(with: sesiones)
            case .failure(let error):self.displayError(error, title: "No se pudo acceder a los datos")
            }
        }
        PieChart.legend.textColor = UIColor.black
        customizeChart(dataPoints: sexosLabels2, values: counts2.map{ Double($0) })
    }
    func displayError(_ error: Error, title: String){
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: error.localizedDescription, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
        
    func updateUI(with sesiones: Sesiones){
        DispatchQueue.main.async {
            self.indicadores = sesiones
            for i in 0..<self.indicadores.count
            {
                self.sexo = self.indicadores[i].tipoIntervencion
                self.sexos.append(self.sexo)
            }
            
            for i in 0..<self.sexos.count
            {
                if (self.sexos[i] == "Acompañamiento Grupal")
                {
                    self.counts[0] += 1
                }
                else if (self.sexos[i] == "Acompañamiento Individual")
                {
                    self.counts[1] += 1
                }
                else if (self.sexos[i] == "Angeloterapia")
                {
                    self.counts[2] += 1
                }
                else if (self.sexos[i] == "Aromaterapia y Musicoterapia")
                {
                    self.counts[3] += 1
                }
                else if (self.sexos[i] == "Biomagnetismo")
                {
                    self.counts[4] += 1
                }
                else if (self.sexos[i] == "Brisas Ambientales")
                {
                    self.counts[5] += 1
                }
                else if (self.sexos[i] == "Cama Térmica de Jade")
                {
                    self.counts[6] += 1
                }
                else if (self.sexos[i] == "Cristaloterapia")
                {
                    self.counts[7] += 1
                }
                else if (self.sexos[i] == "Logoterapia")
                {
                    self.counts[8] += 1
                }
                else if (self.sexos[i] == "Mindfulness")
                {
                    self.counts[9] += 1
                }
                else if (self.sexos[i] == "Reiki")
                {
                    self.counts[10] += 1
                }
                else if (self.sexos[i] == "Tanatología")
                {
                    self.counts[11] += 1
                }
                
            }
            for i in 0..<self.sexosLabels.count
            {
                if self.counts[i] != 0
                {
                    self.sexosLabels2.append(self.sexosLabels[i])
                    self.counts2.append(Double(self.counts[i]))
                }
            }
            self.customizeChart(dataPoints: self.sexosLabels2, values: self.counts2.map{ Double($0) })
        }
      
    }
    
    
     func customizeChart(dataPoints: [String], values: [Double]) {
       
       // 1. Set ChartDataEntry
       var dataEntries: [ChartDataEntry] = []
       for i in 0..<dataPoints.count {
         let dataEntry = PieChartDataEntry(value: values[i], label: dataPoints[i], data:  dataPoints[i] as AnyObject)
         dataEntries.append(dataEntry)
       }
       
       // 2. Set ChartDataSet
         let pieChartDataSet = PieChartDataSet(entries: dataEntries, label: nil)
       pieChartDataSet.colors = colorsOfCharts(numbersOfColor: dataPoints.count)
       
       // 3. Set ChartData
       let pieChartData = PieChartData(dataSet: pieChartDataSet)
       let format = NumberFormatter()
       format.numberStyle = .none
       let formatter = DefaultValueFormatter(formatter: format)
       pieChartData.setValueFormatter(formatter)
       
       // 4. Assign it to the chart's data
       PieChart.data = pieChartData
     }
         
     private func colorsOfCharts(numbersOfColor: Int) -> [UIColor] {
       var colors: [UIColor] = []
       for _ in 0..<numbersOfColor {
         let red = Double(arc4random_uniform(256))
         let green = Double(arc4random_uniform(256))
         let blue = Double(arc4random_uniform(256))
         let color = UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1)
         colors.append(color)
       }
       return colors
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
