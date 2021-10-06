//
//  InformacionCETAC.swift
//  CETACApp
//
//  Created by Sotero Osuna on 30/09/21.
//

import Foundation
import Firebase

struct ModuloInformacion: Codable {
    let id, titulo, descripcion, imagen: String
    
    init(id: String, titulo: String, descripcion: String, imagen: String) {
        self.id = id
        self.titulo = titulo
        self.descripcion = descripcion
        self.imagen = imagen
    }
    init(titulo: String, descripcion: String, imagen: String) {
        id = "0"
        self.titulo = titulo
        self.descripcion = descripcion
        self.imagen = imagen
    }
    
    init(aDoc: DocumentSnapshot) {
        self.id = aDoc.documentID
        self.titulo = aDoc.get("titulo") as? String ?? ""
        self.descripcion = aDoc.get("descripcion") as? String ?? ""
        self.imagen = aDoc.get("imagen") as? String ?? ""
    }
}

typealias ModulosInformacion = [ModuloInformacion]
