//
//  SesionController.swift
//  CETACApp
//
//  Created by Sotero Osuna on 16/10/21.
//

import Foundation
import Firebase

class SesionController {
    
    let db = Firestore.firestore()
    
    func fetchInformacion(completion: @escaping
    (Result<Sesiones, Error>) -> Void) {
        
        var sesiones = Sesiones()
        db.collection("Sesiones").getDocuments()  { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
                completion(.failure(err))
            } else {
              
                for document in querySnapshot!.documents {
                    if (document.get("numeroSesion") as! Int == 1) {
                        let s = NuevaSesion(aDoc: document)
                        sesiones.append(s)
                    }
                    else {
                        let s = SesionSeguimiento(aDoc: document)
                        sesiones.append(s)
                    }
                }
                completion(.success(sesiones))
            }
        }
    }
    
    func fetchInformacionP(completion: @escaping
    (Result<[NuevaSesion], Error>) -> Void) {
        
        var sesiones = [NuevaSesion]()
        db.collection("Sesiones").getDocuments()  { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
                completion(.failure(err))
            } else {
              
                for document in querySnapshot!.documents {
                    if (document.get("numeroSesion") as! Int == 1) {
                        let s = NuevaSesion(aDoc: document)
                        sesiones.append(s)
                    }
                }
                completion(.success(sesiones))
            }
        }
    }
    
    func fetchInformacionT(nombreTanatologo: String, completion: @escaping
    (Result<Sesiones, Error>) -> Void) {
        
        var sesiones = Sesiones()
        db.collection("Sesiones").getDocuments()  { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
                completion(.failure(err))
            } else {
              
                for document in querySnapshot!.documents {
                    if (document.get("nombreTanatologo") as! String == nombreTanatologo) {
                        if (document.get("numeroSesion") as! Int == 1) {
                            let s = NuevaSesion(aDoc: document)
                            sesiones.append(s)
                        }
                        else {
                            let s = SesionSeguimiento(aDoc: document)
                            sesiones.append(s)
                        }
                    }
                }
                completion(.success(sesiones))
            }
        }
    }
    
    func deleteSesion(sesionID:String, completion: @escaping (Result<String, Error>) -> Void){
        
        db.collection("Sesiones").document(sesionID).delete() { err in
            if let err = err {
                print("Error removing document: \(err)")
                completion(.failure(err))
            } else {
                print("Document successfully removed!")
                completion(.success("Document successfully removed!"))
            }
        }
    }
    
    func insertNuevaSesion(sesion:NuevaSesion, completion: @escaping (Result<String, Error>) -> Void){
        
        var ref: DocumentReference? = nil
        ref = db.collection("Sesiones").addDocument(data: [
//            "titulo": moduloInformacion.titulo,
            "numeroSesion": sesion.numeroSesion,
            "nombreTanatologo": sesion.nombreTanatologo,
            "nombreUsuario": sesion.nombreUsuario,
            "ocupacion": sesion.ocupacion,
            "religion": sesion.religion,
            "procedencia": sesion.procedencia,
            "domicilio":  sesion.domicilio,
            "telefonoCasa": sesion.telefonoCasa,
            "estadoCivil": sesion.estadoCivil,
            "edad": sesion.edad,
            "sexo": sesion.sexo,
            "hijos": sesion.hijos,
            "referencia": sesion.referencia,
            "motivoConsulta": sesion.motivoConsulta,
            "identificacionEtapa": sesion.identificacionEtapa,
            "motivo": sesion.motivo,
            "tipoServicio": sesion.tipoServicio,
            "tipoIntervencion": sesion.tipoIntervencion,
            "herramienta": sesion.herramienta,
            "evaluacion": sesion.evaluacion,
            "cuotaRecuperacion": sesion.cuotaRecuperacion
            
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
                completion(.failure(err))
            } else {
                completion(.success("Documento agregado ID: \(ref!.documentID)"))
            }
        }
    }
    
    func insertSesionSeguimiento(sesion:SesionSeguimiento, completion: @escaping (Result<String, Error>) -> Void){
        
        var ref: DocumentReference? = nil
        ref = db.collection("Sesiones").addDocument(data: [
//            "titulo": moduloInformacion.titulo,
            "numeroSesion": sesion.numeroSesion,
            "nombreTanatologo": sesion.nombreTanatologo,
            "nombreUsuario": sesion.nombreUsuario,
            "motivo": sesion.motivo,
            "tipoServicio": sesion.tipoServicio,
            "tipoIntervencion": sesion.tipoIntervencion,
            "herramienta": sesion.herramienta,
            "evaluacion": sesion.evaluacion,
            "cuotaRecuperacion": sesion.cuotaRecuperacion
            
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
                completion(.failure(err))
            } else {
                completion(.success("Documento agregado ID: \(ref!.documentID)"))
            }
        }
    }
    
    func updateNuevaSesion(updateSesion:NuevaSesion, completion: @escaping (Result<String, Error>) -> Void){
        db.collection("Sesiones").document(updateSesion.id).updateData([
            "numeroSesion": updateSesion.numeroSesion,
            "nombreTanatologo": updateSesion.nombreTanatologo,
            "nombreUsuario": updateSesion.nombreUsuario,
            "ocupacion": updateSesion.ocupacion,
            "religion": updateSesion.religion,
            "procedencia": updateSesion.procedencia,
            "domicilio":  updateSesion.domicilio,
            "telefonoCasa": updateSesion.telefonoCasa,
            "estadoCivil": updateSesion.estadoCivil,
            "edad": updateSesion.edad,
            "sexo": updateSesion.sexo,
            "hijos": updateSesion.hijos,
            "referencia": updateSesion.referencia,
            "motivoConsulta": updateSesion.motivoConsulta,
            "identificacionEtapa": updateSesion.identificacionEtapa,
            "motivo": updateSesion.motivo,
            "tipoServicio": updateSesion.tipoServicio,
            "tipoIntervencion": updateSesion.tipoIntervencion,
            "herramienta": updateSesion.herramienta,
            "evaluacion": updateSesion.evaluacion,
            "cuotaRecuperacion": updateSesion.cuotaRecuperacion
        ]) { err in
            if let err = err {
                print("Error updating document: \(err)")
                completion(.failure(err))
            } else {
                print("Document successfully updated")
                completion(.success("Document successfully updated"))
            }
        }
    }
}

