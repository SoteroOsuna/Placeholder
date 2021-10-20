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
    var idTestUD: String = ""

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
                    self.idTestUD = ref!.documentID
                    XCTAssertNotNil(db.collection("TestUsuarios").document(docID))
                }
            exp.fulfill()
            }
        self.waitForExpectations(timeout: 20.0)
        
    }
    
    func testDeleteUsuario() {
        let db = Firestore.firestore()
        let exp = self.expectation(description: "DeleteUserTest")
        db.collection("TestUsuarios").document("idTestUD").delete() { err in
            if (err != nil) {
                XCTAssertNil(err)
            }
            exp.fulfill()
        }
        self.waitForExpectations(timeout: 20.0)
    }
    
    func testUpdateUsuario() {
        let db = Firestore.firestore()
        let updateUser = Usuario(nombre: "test", tipoUsuario: "test", usuario: "test", id: "3RdOG4PAeSKIl27Bd4vY", password: "test")
        let exp = self.expectation(description: "UpdateUserTest")
        db.collection("TestUsuarios").document(updateUser.id).updateData([
            "Nombre(s)":updateUser.nombre,
            "Contraseña":updateUser.password,
            "Tipo de Usuario":updateUser.tipoUsuario,
            "Usuario":updateUser.usuario
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
