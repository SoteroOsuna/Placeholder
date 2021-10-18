//
//  InformacionCETACController.swift
//  CETACApp
//
//  Created by Sotero Osuna on 30/09/21.
//

import Foundation
import Firebase

class ModuloInformacionController {
    
    let db = Firestore.firestore()
    
    func fetchInformacion(completion: @escaping
    (Result<ModulosInformacion, Error>) -> Void) {
        
        var modulosInformacion = [ModuloInformacion]()
        db.collection("Informacion").order(by: "orden").getDocuments()  { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
                completion(.failure(err))
            } else {
              
                for document in querySnapshot!.documents {
                    let s = ModuloInformacion(aDoc: document)
                    modulosInformacion.append(s)
                }
                completion(.success(modulosInformacion))
            }
        }
    }
    
    func deleteModuloInformacion(registroID:String, completion: @escaping (Result<String, Error>) -> Void){
        
        db.collection("Informacion").document(registroID).delete() { err in
            if let err = err {
                print("Error removing document: \(err)")
                completion(.failure(err))
            } else {
                print("Document successfully removed!")
                completion(.success("Document successfully removed!"))
            }
        }
    }
    
    func insertModuloInformacion(moduloInformacion:ModuloInformacion, completion: @escaping (Result<String, Error>) -> Void){
        
        var ref: DocumentReference? = nil
        ref = db.collection("Informacion").addDocument(data: [
            "titulo": moduloInformacion.titulo,
            "descripcion": moduloInformacion.descripcion,
            "imagen": moduloInformacion.imagen
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
                completion(.failure(err))
            } else {
                completion(.success("Documento agregado ID: \(ref!.documentID)"))
            }
        }
    }
    
    func updatInformacion(updateModuloInformacion:ModuloInformacion, completion: @escaping (Result<String, Error>) -> Void){
        db.collection("Informacion").document(updateModuloInformacion.id).updateData([
            "titulo": updateModuloInformacion.titulo,
            "descripcion":updateModuloInformacion.descripcion,
            "imagen": updateModuloInformacion.imagen
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
