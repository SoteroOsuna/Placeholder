//
//  UsersModuleTest.swift
//  CETACAppTests
//
//  Created by Sotero Osuna on 19/10/21.
//

import XCTest
import Firebase

@testable import CETACApp

class UsersModuleTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFireBaseConnection() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let db = Firestore.firestore()
        db.collection("Usuarios").getDocuments()  { (querySnapshot, err) in
            if (err != nil) {
                XCTAssertNil(err)
            }
        }
    }
    
//    Correct Parameters for Data Retrieval
    func testDataRetrieval1() throws {
        let db = Firestore.firestore()
        var usuarios = Usuarios()
        let expectedSize = 0
        let exp = self.expectation(description: "UsuariosTest")
        db.collection("Usuarios").getDocuments()  { (querySnapshot, err) in
            if (err != nil) {
                XCTAssertNil(err)
            } else {
                for document in querySnapshot!.documents {
                    let u = Usuario(aDoc: document)
                    usuarios.append(u)
                
                }
                XCTAssertGreaterThan(usuarios.count, expectedSize)
            }
            exp.fulfill()
        }
        self.waitForExpectations(timeout: 10.0)
    }
        
//    Unexpected Value/Order  for Data Retrieval
    func testDataRetrieval2() throws {
        let db = Firestore.firestore()
        var usuarios = Usuarios()
        let expectedSize = 100
        let exp = self.expectation(description: "UsuariosTest")
        db.collection("Usuarios").getDocuments()  { (querySnapshot, err) in
            if (err != nil) {
                XCTAssertNil(err)
            } else {
                for document in querySnapshot!.documents {
                    let u = Usuario(aDoc: document)
                    usuarios.append(u)
                }
                XCTAssertLessThan(usuarios.count, expectedSize)
            }
            exp.fulfill()
        }
        self.waitForExpectations(timeout: 10.0)
    }
        
//        Accessing Wrong Collection for Data Retrieval
    func testDataRetrieval3() throws {
        let db = Firestore.firestore()
        var usuarios = Usuarios()
        let expectedSize = 100
        let exp = self.expectation(description: "UsuariosTest")
        db.collection("Usuarios").getDocuments()  { (querySnapshot, err) in
            if (err != nil) {
                XCTAssertNil(err)
            } else {
                for document in querySnapshot!.documents {
                    let u = Usuario(aDoc: document)
                    usuarios.append(u)
                }
                XCTAssertLessThan(usuarios.count, expectedSize)
            }
            exp.fulfill()
        }
        self.waitForExpectations(timeout: 10.0)
    }
    
    func testCrearUsuario() throws {
        let db = Firestore.firestore()
        let userTest = Usuario(nombre: "Test", tipoUsuario: "Admin", usuario: "TestGuy", password: "123456")
        let exp = self.expectation(description: "InsertUserTest")
        var ref: DocumentReference? = nil
        ref = db.collection("TestUsuarios").addDocument(data: [
            "Nombre(s)": userTest.nombre,
            "Usuario": userTest.usuario,
            "Contraseña": userTest.password,
            "Tipo de Usuario": userTest.tipoUsuario
        ]) { err in
                if err != nil {
                    XCTAssertNil(err)
                } else {
                    let docID = ref!.documentID
                    XCTAssertNotNil(db.collection("TestUsuarios").document(docID))
                }
            exp.fulfill()
            }
        self.waitForExpectations(timeout: 20.0)
        
    }
    
    func testDeleteSesion() {
        let db = Firestore.firestore()
        let exp = self.expectation(description: "DeleteUserTest")
        db.collection("TestUsuarios").document("TESTID").delete() { err in
            if (err != nil) {
                XCTAssertNotNil(err)
            }
            exp.fulfill()
        }
        self.waitForExpectations(timeout: 20.0)
    }
    
    func testUpdateNuevaSesion() {
        let db = Firestore.firestore()
        let updateSesion = NuevaSesion(id: "AUbURqQ49ttidbc02FA7", nombreTanatologo: "test", nombreUsuario: "test", ocupacion: "test", religion: "test", procedencia: "test", domicilio: "test", telefonoCasa: "test", estadoCivil: "test", edad: 18, sexo: "test", hijos: "test", referencia: "test", motivoConsulta: "test", identificacionEtapa: "test", motivo: "test", tipoServicio: "test", tipoIntervencion: "test", herramienta: "test", evaluacion: "test", cuotaRecuperacion: 10.0)
        let exp = self.expectation(description: "UpdateNuevaSesionTest")
        db.collection("TestSesiones").document(updateSesion.id).updateData([
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
            if err != nil {
              XCTAssertNil(err)
            }
            exp.fulfill()
        }
        self.waitForExpectations(timeout: 20.0)
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
