//
//  indicadoresPrueba.swift
//  CETACApp
//
//  Created by Juan Díaz on 20/10/21.
//

import Foundation
import Firebase

struct indicadoresGraficas: Codable {
    let id: String
    let motivo, tipoServicio, tipoIntervencion, herramienta: String
    init(motivo: String, tipoServicio:String, tipoIntervencion:String, herramienta:String){
        self.motivo = motivo
        self.tipoServicio = tipoServicio
        self.tipoIntervencion = tipoIntervencion
        self.herramienta = herramienta
        self.id = "1234"
    }
    
    init(motivo: String, tipoServicio:String, tipoIntervencion:String, herramienta:String, id:String){
        self.motivo = motivo
        self.tipoServicio = tipoServicio
        self.tipoIntervencion = tipoIntervencion
        self.herramienta = herramienta
        self.id = id
    }
    init(aDoc: DocumentSnapshot){
        self.motivo = aDoc.get("motivo") as? String ?? ""
        self.tipoServicio = aDoc.get("tipoServicio") as? String ?? ""
        self.tipoIntervencion = aDoc.get("tipoIntervencion") as? String ?? ""
        self.herramienta = aDoc.get("herramienta") as? String ?? ""
        self.id = aDoc.documentID
    }
    
}

typealias Indicador = [indicadoresGraficas]
