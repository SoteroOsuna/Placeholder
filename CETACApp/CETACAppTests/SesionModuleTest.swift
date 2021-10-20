//
//  SesionModuleTest.swift
//  CETACAppTests
//
//  Created by Sotero Osuna on 19/10/21.
//

import XCTest
import Firebase

@testable import CETACApp

class SesionModuleTest: XCTestCase {

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
        db.collection("Sesiones").getDocuments()  { (querySnapshot, err) in
            if (err != nil) {
                XCTAssertNil(err)
            }
        }
    }
    
//    Correct Parameters for Data Retrieval
    func testDataRetrieval1() throws {
        let db = Firestore.firestore()
        var sesiones = Sesiones()
        let expectedSize = 0
        let exp = self.expectation(description: "SesionesTest")
        db.collection("Sesiones").getDocuments()  { (querySnapshot, err) in
            if (err != nil) {
                XCTAssertNil(err)
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
                XCTAssertGreaterThan(sesiones.count, expectedSize)
            }
            exp.fulfill()
        }
        self.waitForExpectations(timeout: 10.0)
    }
        
//    Unexpected Value/Order  for Data Retrieval
    func testDataRetrieval2() throws {
        let db = Firestore.firestore()
        var sesiones = Sesiones()
        let expectedSize = 100
        let exp = self.expectation(description: "InfoTest")
        db.collection("Sesiones").getDocuments()  { (querySnapshot, err) in
            if (err != nil) {
                XCTAssertNil(err)
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
                XCTAssertLessThan(sesiones.count, expectedSize)
            }
            exp.fulfill()
        }
        self.waitForExpectations(timeout: 10.0)
    }
        
//        Accessing Wrong Collection for Data Retrieval
    func testDataRetrieval3() throws {
        let db = Firestore.firestore()
        var sesiones = Sesiones()
        let expectedSize = 0
        let exp = self.expectation(description: "InsertSesionTest")
        db.collection("Sesioness").getDocuments()  { (querySnapshot, err) in
            if (err != nil) {
                XCTAssertNotNil(err)
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
                XCTAssertEqual(expectedSize, sesiones.count)
            }
            exp.fulfill()
        }
        self.waitForExpectations(timeout: 10.0)
    }
    
    func testInsertNuevaSesion() throws {
        let db = Firestore.firestore()
        let sesionTest = NuevaSesion(id: "testID", nombreTanatologo: "test", nombreUsuario: "test", ocupacion: "test", religion: "test", procedencia: "test", domicilio: "test", telefonoCasa: "test", estadoCivil: "test", edad: 18, sexo: "test", hijos: "test", referencia: "test", motivoConsulta: "test", identificacionEtapa: "test", motivo: "test", tipoServicio: "test", tipoIntervencion: "test", herramienta: "test", evaluacion: "test", cuotaRecuperacion: 10.0)
        let exp = self.expectation(description: "InsertSesionTest")
        var ref: DocumentReference? = nil
        ref = db.collection("TestSesiones").addDocument(data: [
//            "titulo": moduloInformacion.titulo,
            "ID": sesionTest.id,
            "numeroSesion": sesionTest.numeroSesion,
            "nombreTanatologo": sesionTest.nombreTanatologo,
            "nombreUsuario": sesionTest.nombreUsuario,
            "ocupacion": sesionTest.ocupacion,
            "religion": sesionTest.religion,
            "procedencia": sesionTest.procedencia,
            "domicilio":  sesionTest.domicilio,
            "telefonoCasa": sesionTest.telefonoCasa,
            "estadoCivil": sesionTest.estadoCivil,
            "edad": sesionTest.edad,
            "sexo": sesionTest.sexo,
            "hijos": sesionTest.hijos,
            "referencia": sesionTest.referencia,
            "motivoConsulta": sesionTest.motivoConsulta,
            "identificacionEtapa": sesionTest.identificacionEtapa,
            "motivo": sesionTest.motivo,
            "tipoServicio": sesionTest.tipoServicio,
            "tipoIntervencion": sesionTest.tipoIntervencion,
            "herramienta": sesionTest.herramienta,
            "evaluacion": sesionTest.evaluacion,
            "cuotaRecuperacion": sesionTest.cuotaRecuperacion
        ]) { err in
                if err != nil {
                    XCTAssertNil(err)
                } else {
                    let docID = ref!.documentID
                    XCTAssertNotNil(db.collection("TestSesiones").document(docID))
                }
            exp.fulfill()
            }
        self.waitForExpectations(timeout: 20.0)
        
    }
    
    func testInsertSesionSeguimiento() throws {
        let db = Firestore.firestore()
        let sesionTest = SesionSeguimiento(numeroSesion: 2, nombreTanatologo: "test", nombreUsuario: "test", motivo: "test", tipoServicio: "test", tipoIntervencion: "test", herramienta: "test", evaluacion: "test", cuotaRecuperacion: 10.0)
        let exp = self.expectation(description: "InsertSesionTest")
        var ref: DocumentReference? = nil
        ref = db.collection("TestSesiones").addDocument(data: [
            "ID": sesionTest.id,
            "numeroSesion": sesionTest.numeroSesion,
            "nombreTanatologo": sesionTest.nombreTanatologo,
            "nombreUsuario": sesionTest.nombreUsuario,
            "motivo": sesionTest.motivo,
            "tipoServicio": sesionTest.tipoServicio,
            "tipoIntervencion": sesionTest.tipoIntervencion,
            "herramienta": sesionTest.herramienta,
            "evaluacion": sesionTest.evaluacion,
            "cuotaRecuperacion": sesionTest.cuotaRecuperacion
        ]) { err in
                if err != nil {
                    XCTAssertNil(err)
                } else {
                    let docID = ref!.documentID
                    XCTAssertNotNil(db.collection("TestSesiones").document(docID))
                }
            exp.fulfill()
            }
        self.waitForExpectations(timeout: 20.0)
        
    }
    
    func testDeleteSesion() {
        let db = Firestore.firestore()
        let exp = self.expectation(description: "DeleteSesionTest")
        db.collection("Sesiones").document("NOTEXISTENT").delete() { err in
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
    
    
    

}
