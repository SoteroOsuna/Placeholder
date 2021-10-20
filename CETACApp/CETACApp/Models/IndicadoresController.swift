//
//  IndicadoresController.swift
//  CETACApp
//
//  Created by Juan Díaz on 20/10/21.
//

import Foundation
import Firebase
import FirebaseFirestore
class IndicadoresController {
    let db = Firestore.firestore()
    
    func fetchReportesIndicadores(completion: @escaping
    (Result<Indicador, Error>) -> Void) {
        
        var indicadores = [indicadoresGraficas]()
        db.collection("Sesiones").getDocuments()  { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
                completion(.failure(err))
            } else {
              
                for document in querySnapshot!.documents {
                    let s = indicadoresGraficas(aDoc: document)
                    indicadores.append(s)
                }
                completion(.success(indicadores))
            }
        }
    }

}
