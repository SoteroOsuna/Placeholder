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
    let nombrePila, apellidoP, apellidoM, tipoUsuario, usuario, password: String
    init(nombrePila:String, apellidoP:String, apellidoM:String, tipoUsuario:String, usuario:String, password:String){
        self.nombrePila = nombrePila
        self.apellidoP = apellidoP
        self.apellidoM = apellidoM
        self.tipoUsuario = tipoUsuario
        self.usuario = usuario
        self.password = password
        self.id = "1234"
    }
    
    init(nombrePila:String, apellidoP:String, apellidoM:String, tipoUsuario:String, usuario:String, id:String, password:String){
        self.nombrePila = nombrePila
        self.apellidoP = apellidoP
        self.apellidoM = apellidoM
        self.tipoUsuario = tipoUsuario
        self.usuario = usuario
        self.password = password
        self.id = id
    }
    init(aDoc: DocumentSnapshot){
        self.nombrePila = aDoc.get("Nombre(s)") as? String ?? ""
        self.apellidoP = aDoc.get("Apellido Paterno") as? String ?? ""
        self.apellidoM = aDoc.get("Apellido Materno") as? String ?? ""
        self.tipoUsuario = aDoc.get("Tipo de Usuario") as? String ?? ""
        self.usuario = aDoc.get("Usuario") as? String ?? ""
        self.password = aDoc.get("Contraseña") as? String ?? ""
        self.id = aDoc.documentID
    }
    
}

typealias Usuarios = [Usuario]
