//
//  MotivosViewController.swift
//  CETACApp
//
//  Created by Juan Díaz on 20/10/21.
//

import UIKit
import Firebase
import Charts

class MotivosViewController: UIViewController {
    @IBOutlet weak var PieChart: PieChartView!
    
    var sesionControlador = SesionController()
    var indicadores = Sesiones()
    var sexo:String = ""
    var sexos = [String]()
    var sexosLabels = listaMotivos
    var counts = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
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
                self.sexo = self.indicadores[i].motivo
                self.sexos.append(self.sexo)
            }
            
            for i in 0..<self.sexos.count
            {
                if (self.sexos[i] == "Abuso")
                {
                    self.counts[0] += 1
                }
                else if (self.sexos[i] == "Adicción")
                {
                    self.counts[1] += 1
                }
                else if (self.sexos[i] == "Ansiedad")
                {
                    self.counts[2] += 1
                }
                else if (self.sexos[i] == "Baja Autoestima")
                {
                    self.counts[3] += 1
                }
                else if (self.sexos[i] == "Codependencia")
                {
                    self.counts[4] += 1
                }
                else if (self.sexos[i] == "Comunicación Familiar")
                {
                    self.counts[5] += 1
                }
                else if (self.sexos[i] == "Conflicto con Hermano")
                {
                    self.counts[6] += 1
                }
                else if (self.sexos[i] == "Conflicto con Madre")
                {
                    self.counts[7] += 1
                }
                else if (self.sexos[i] == "Conflicto con Padre")
                {
                    self.counts[8] += 1
                }
                else if (self.sexos[i] == "Dependencia")
                {
                    self.counts[9] += 1
                }
                else if (self.sexos[i] == "Divorcio")
                {
                    self.counts[10] += 1
                }
                else if (self.sexos[i] == "Duelo")
                {
                    self.counts[11] += 1
                }
                else if (self.sexos[i] == "Enfermedad")
                {
                    self.counts[12] += 1
                }
                else if (self.sexos[i] == "Enfermedad Crónico Degenerativa")
                {
                    self.counts[13] += 1
                }
                else if (self.sexos[i] == "Estrés")
                {
                    self.counts[14] += 1
                }
                else if (self.sexos[i] == "Heridas de la Infancia")
                {
                    self.counts[15] += 1
                }
                else if (self.sexos[i] == "Identidad de Género")
                {
                    self.counts[16] += 1
                }
                else if (self.sexos[i] == "Infertilidad")
                {
                    self.counts[17] += 1
                }
                else if (self.sexos[i] == "Infidelidad")
                {
                    self.counts[18] += 1
                }
                else if (self.sexos[i] == "Intento de Suicidio")
                {
                    self.counts[19] += 1
                }
                else if (self.sexos[i] == "Miedo")
                {
                    self.counts[20] += 1
                }
                else if (self.sexos[i] == "Pérdida Laboral")
                {
                    self.counts[21] += 1
                }
                else if (self.sexos[i] == "Pérdida de Bienes Materiales")
                {
                    self.counts[22] += 1
                }
                else if (self.sexos[i] == "Pérdida de Identidad")
                {
                    self.counts[23] += 1
                }
                else if (self.sexos[i] == "Relación con los Padres")
                {
                    self.counts[24] += 1
                }
                else if (self.sexos[i] == "Ruptura de Noviazgo")
                {
                    self.counts[25] += 1
                }
                else if (self.sexos[i] == "Trastorno Obsesivo")
                {
                    self.counts[26] += 1
                }
                else if (self.sexos[i] == "Violación")
                {
                    self.counts[27] += 1
                }
                else if (self.sexos[i] == "Violencia Intrafamiliar")
                {
                    self.counts[28] += 1
                }
                else if (self.sexos[i] == "Violencia Psicológica")
                {
                    self.counts[29] += 1
                }
                else if (self.sexos[i] == "Viudez")
                {
                    self.counts[30] += 1
                }
                else if (self.sexos[i] == "Otro")
                {
                    self.counts[31] += 1
                }
                else if (self.sexos[i] == "Duelo Grupal")
                {
                    self.counts[32] += 1
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


}
