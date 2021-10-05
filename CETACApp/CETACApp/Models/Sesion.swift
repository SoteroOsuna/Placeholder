//
//  Sesion.swift
//  CETACApp
//
//  Created by Sotero Osuna on 03/10/21.
//

import Foundation

protocol Sesion {
    var expedienteElectronico: String {get set}
    var numeroSesion: Int {get set}
    var nombreTanatologo: String {get set}
    var nombreUsuario: String {get set}
    var motivo: String {get set}
    var tipoServicio: String {get set}
    var intervencion: String {get set}
    var herramienta: String {get set}
    var evaluacionSesion: String {get set}
    var cuotaRecuperacion: Float {get set}
}

struct primeraSesion: Sesion {
    var expedienteElectronico: String
    var numeroSesion = 1
    var nombreTanatologo: String
    var nombreUsuario: String
    var motivo: String
    var tipoServicio: String
    var intervencion: String
    var herramienta: String
    var evaluacionSesion: String
    var cuotaRecuperacion: Float
    var cerrarExpediente: Bool
    
}

struct sesionSeguimiento: Sesion {
    var expedienteElectronico: String
    var numeroSesion: Int
    var nombreTanatologo: String
    var nombreUsuario: String
    var motivo: String
    var tipoServicio: String
    var intervencion: String
    var herramienta: String
    var evaluacionSesion: String
    var cuotaRecuperacion: Float
    var cerrarExpediente: Bool
}

typealias Sesiones = [Sesion]
