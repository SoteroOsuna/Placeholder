//
//  Usuario.swift
//  CETACApp
//
//  Created by Sotero Osuna on 09/10/21.
//

import Foundation
import Firebase

struct Usuario: Codable {
    let id: String
    let nombre, tipoUsuario, usuario, password: String
    init(nombre: String, tipoUsuario:String, usuario:String, password:String){
        self.nombre = nombre
        self.tipoUsuario = tipoUsuario
        self.usuario = usuario
        self.password = password
        self.id = "1234"
    }
    
    init(nombre:String, tipoUsuario:String, usuario:String, id:String, password:String){
        self.nombre = nombre
        self.tipoUsuario = tipoUsuario
        self.usuario = usuario
        self.password = password
        self.id = id
    }
    init(aDoc: DocumentSnapshot){
        self.nombre = aDoc.get("Nombre(s)") as? String ?? ""
        self.tipoUsuario = aDoc.get("Tipo de Usuario") as? String ?? ""
        self.usuario = aDoc.get("Usuario") as? String ?? ""
        self.password = aDoc.get("Contraseña") as? String ?? ""
        self.id = aDoc.documentID
    }
    
}

typealias Usuarios = [Usuario]
