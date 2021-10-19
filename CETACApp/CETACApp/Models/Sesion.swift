//
//  Sesion.swift
//  CETACApp
//
//  Created by Sotero Osuna on 03/10/21.
//

import Foundation
import Firebase

protocol Sesion {
    var id: String {get set}
    var numeroSesion: Int {get set}
    var nombreTanatologo: String {get set}
    var nombreUsuario: String {get set}
    var motivo: String {get set}
    var tipoServicio: String {get set}
    var tipoIntervencion: String {get set}
    var herramienta: String {get set}
    var evaluacion: String {get set}
    var cuotaRecuperacion: Float {get set}
}

struct NuevaSesion: Sesion {
    
    var id: String
    var numeroSesion = 1
    var nombreTanatologo: String
    var nombreUsuario: String
    var ocupacion: String
    var religion: String
    var procedencia: String
    var domicilio: String
    var telefonoCasa: String
    var estadoCivil: String
    var edad: Int
    var sexo: String
    var hijos: String
    var referencia: String
    var motivoConsulta: String
    var identificacionEtapa: String
    var motivo: String
    var tipoServicio: String
    var tipoIntervencion: String
    var herramienta: String
    var evaluacion: String
    var cuotaRecuperacion: Float
    
    init(id: String, nombreTanatologo: String, nombreUsuario: String, ocupacion: String, religion: String,
         procedencia: String, domicilio: String, telefonoCasa: String, estadoCivil: String,
         edad: Int, sexo: String, hijos: String, referencia: String, motivoConsulta: String,
         identificacionEtapa: String, motivo: String, tipoServicio: String, tipoIntervencion: String,
         herramienta: String, evaluacion: String, cuotaRecuperacion: Float) {
        self.id = id
        numeroSesion = 1
        self.nombreTanatologo = nombreTanatologo
        self.nombreUsuario = nombreUsuario
        self.ocupacion = ocupacion
        self.religion = religion
        self.procedencia = procedencia
        self.domicilio = domicilio
        self.telefonoCasa = telefonoCasa
        self.estadoCivil = estadoCivil
        self.edad = edad
        self.sexo = sexo
        self.hijos = hijos
        self.referencia = referencia
        self.motivoConsulta = motivoConsulta
        self.identificacionEtapa = identificacionEtapa
        self.motivo = motivo
        self.tipoServicio = tipoServicio
        self.tipoIntervencion = tipoIntervencion
        self.herramienta = herramienta
        self.evaluacion = evaluacion
        self.cuotaRecuperacion = cuotaRecuperacion
        
    }
    
    init(nombreTanatologo: String, nombreUsuario: String, ocupacion: String, religion: String,
         procedencia: String, domicilio: String, telefonoCasa: String, estadoCivil: String,
         edad: Int, sexo: String, hijos: String, referencia: String, motivoConsulta: String,
         identificacionEtapa: String, motivo: String, tipoServicio: String, tipoIntervencion: String,
         herramienta: String, evaluacion: String, cuotaRecuperacion: Float) {
        id = "01234567890"
        numeroSesion = 1
        self.nombreTanatologo = nombreTanatologo
        self.nombreUsuario = nombreUsuario
        self.ocupacion = ocupacion
        self.religion = religion
        self.procedencia = procedencia
        self.domicilio = domicilio
        self.telefonoCasa = telefonoCasa
        self.estadoCivil = estadoCivil
        self.edad = edad
        self.sexo = sexo
        self.hijos = hijos
        self.referencia = referencia
        self.motivoConsulta = motivoConsulta
        self.identificacionEtapa = identificacionEtapa
        self.motivo = motivo
        self.tipoServicio = tipoServicio
        self.tipoIntervencion = tipoIntervencion
        self.herramienta = herramienta
        self.evaluacion = evaluacion
        self.cuotaRecuperacion = cuotaRecuperacion
        
    }
    
    init(aDoc: DocumentSnapshot) {
        self.id = aDoc.documentID
        numeroSesion = 1
        self.nombreTanatologo = aDoc.get("nombreTanatologo") as? String ?? ""
        self.nombreUsuario = aDoc.get("nombreUsuario") as? String ?? ""
        self.ocupacion = aDoc.get("ocupacion") as? String ?? ""
        self.religion = aDoc.get("religion") as? String ?? ""
        self.procedencia = aDoc.get("procedencia") as? String ?? ""
        self.domicilio = aDoc.get("domicilio") as? String ?? ""
        self.telefonoCasa = aDoc.get("telefonoCasa") as? String ?? ""
        self.estadoCivil = aDoc.get("estadoCivil") as? String ?? ""
        self.edad = aDoc.get("edad") as? Int ?? 18
        self.sexo = aDoc.get("sexo") as? String ?? ""
        self.hijos = aDoc.get("hijos") as? String ?? ""
        self.referencia = aDoc.get("referencia") as? String ?? ""
        self.motivoConsulta = aDoc.get("motivoConsulta") as? String ?? ""
        self.identificacionEtapa = aDoc.get("identificacionEtapa") as? String ?? ""
        self.motivo = aDoc.get("motivo") as? String ?? ""
        self.tipoServicio = aDoc.get("tipoServicio") as? String ?? ""
        self.tipoIntervencion = aDoc.get("tipoIntervencion") as? String ?? ""
        self.herramienta = aDoc.get("herramienta") as? String ?? ""
        self.evaluacion = aDoc.get("evaluacion") as? String ?? ""
        self.cuotaRecuperacion = aDoc.get("cuotaRecuperacion") as? Float ?? 0.0
    }

}

struct SesionSeguimiento: Sesion {
    
    var id: String
    var numeroSesion: Int
    var nombreTanatologo: String
    var nombreUsuario: String
    var motivo: String
    var tipoServicio: String
    var tipoIntervencion: String
    var herramienta: String
    var evaluacion: String
    var cuotaRecuperacion: Float
    
    init(numeroSesion: Int, nombreTanatologo: String, nombreUsuario: String, motivo: String, tipoServicio: String, tipoIntervencion: String,
         herramienta: String, evaluacion: String, cuotaRecuperacion: Float) {
        id = "01234567890"
        self.numeroSesion = numeroSesion
        self.nombreTanatologo = nombreTanatologo
        self.nombreUsuario = nombreUsuario
        self.motivo = motivo
        self.tipoServicio = tipoServicio
        self.tipoIntervencion = tipoIntervencion
        self.herramienta = herramienta
        self.evaluacion = evaluacion
        self.cuotaRecuperacion = cuotaRecuperacion
        
    }
    
    init(aDoc: DocumentSnapshot) {
        
        self.id = aDoc.documentID
        self.numeroSesion = aDoc.get("numeroSesion") as? Int ?? 0
        self.nombreTanatologo = aDoc.get("nombreTanatologo") as? String ?? ""
        self.nombreUsuario = aDoc.get("nombreUsuario") as? String ?? ""
        self.motivo = aDoc.get("motivo") as? String ?? ""
        self.tipoServicio = aDoc.get("tipoServicio") as? String ?? ""
        self.tipoIntervencion = aDoc.get("tipoIntervencion") as? String ?? ""
        self.herramienta = aDoc.get("herramienta") as? String ?? ""
        self.evaluacion = aDoc.get("evaluacion") as? String ?? ""
        self.cuotaRecuperacion = aDoc.get("cuotaRecuperacion") as? Float ?? 0.0
    }
}

typealias Sesiones = [Sesion]
