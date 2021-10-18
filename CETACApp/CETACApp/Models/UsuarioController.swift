//
//  UsuarioController.swift
//  CETACApp
//
//  Created by Sotero Osuna on 09/10/21.
//

import Foundation
import Firebase

class UsuarioController {
    
    let db = Firestore.firestore()
    
    func fetchInformacion(completion: @escaping
    (Result<Usuarios, Error>) -> Void) {
        
        var usuarios = [Usuario]()
        db.collection("Usuarios").getDocuments()  { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
                completion(.failure(err))
            } else {
              
                for document in querySnapshot!.documents {
                    let s = Usuario(aDoc: document)
                    usuarios.append(s)
                }
                completion(.success(usuarios))
            }
        }
    }
    
    
    func deleteUsuario(registroID:String, completion: @escaping (Result<String, Error>) -> Void){
        
        db.collection("Usuarios").document(registroID).delete() { err in
            if let err = err {
                print("Error removing document: \(err)")
                completion(.failure(err))
            } else {
                print("Document successfully removed!")
                completion(.success("Document successfully removed!"))
            }
        }
    }
    
    func insertUsuario(usuario:Usuario, completion: @escaping (Result<String, Error>) -> Void){
        
        var ref: DocumentReference? = nil
        ref = db.collection("Usuarios").addDocument(data: [
            "Nombre(s)": usuario.nombre,
            "Usuario": usuario.usuario,
            "Contraseña": usuario.password,
            "Tipo de Usuario": usuario.tipoUsuario
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
                completion(.failure(err))
            } else {
                completion(.success("Documento agregado ID: \(ref!.documentID)"))
            }
        }
    }
    
    func updateUsuario(usuario:Usuario, completion: @escaping (Result<String, Error>) -> Void){
        db.collection("Usuarios").document(usuario.id).updateData([
            "Nombre(s)": usuario.nombre,
            "Usuario": usuario.usuario,
            "Contraseña": usuario.password,
            "Tipo de Usuario": usuario.tipoUsuario
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
