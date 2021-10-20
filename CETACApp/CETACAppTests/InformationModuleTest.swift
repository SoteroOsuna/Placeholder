//
//  InformationModuleTest.swift
//  CETACAppTests
//
//  Created by Sotero Osuna on 10/10/21.
//

import XCTest
import Firebase

@testable import CETACApp

class InformationModuleTest: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let db = Firestore.firestore()
        db.collection("Informaciones").getDocuments()  { (querySnapshot, err) in
            if let err = err {
                XCTAssertNil(err)
            }
        }
        
    }
    
    func testFireBaseConnection() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let db = Firestore.firestore()
        db.collection("Informacion").getDocuments()  { (querySnapshot, err) in
            if (err != nil) {
                XCTAssertNil(err)
            }
        }
    }
    
//    Correct Parameters for Data Retrieval
    func testDataRetrieval1() throws {
        let db = Firestore.firestore()
        var modulosInformacion = [ModuloInformacion]()
        let expectedValue = "Misión"
        let exp = self.expectation(description: "InfoTest")
        db.collection("Informacion").order(by: "orden").getDocuments()  { (querySnapshot, err) in
            if (err != nil) {
                XCTAssertNil(err)
            } else {
                for document in querySnapshot!.documents {
                    let s = ModuloInformacion(aDoc: document)
                    modulosInformacion.append(s)
                }
                XCTAssertEqual(expectedValue, modulosInformacion[0].titulo)
            }
            exp.fulfill()
        }
        self.waitForExpectations(timeout: 10.0)
    }
        
//    Unexpected Value/Order  for Data Retrieval
    func testDataRetrievalTest2() throws {
        let db = Firestore.firestore()
        var modulosInformacion = [ModuloInformacion]()
        let expectedValue = "Misión"
        let exp = self.expectation(description: "InfoTest")
        db.collection("Informacion").getDocuments()  { (querySnapshot, err) in
            if (err != nil) {
                XCTAssertNil(err)
            } else {
                for document in querySnapshot!.documents {
                    let s = ModuloInformacion(aDoc: document)
                    modulosInformacion.append(s)
                }
                XCTAssertNotEqual(expectedValue, modulosInformacion[0].titulo)
            }
            exp.fulfill()
        }
        self.waitForExpectations(timeout: 10.0)
    }
        
//        Accessing Wrong Collection for Data Retrieval
    func testDataRetrievalTest3() throws {
        let db = Firestore.firestore()
        var modulosInformacion = [ModuloInformacion]()
        let expectedSize = 0
        let exp = self.expectation(description: "InfoTest")
        db.collection("Informaciones").getDocuments()  { (querySnapshot, err) in
            if (err != nil) {
                XCTAssertNotNil(err)
            } else {
                for document in querySnapshot!.documents {
                    let s = ModuloInformacion(aDoc: document)
                    modulosInformacion.append(s)
                }
                XCTAssertEqual(expectedSize, modulosInformacion.count)
            }
            exp.fulfill()
        }
        self.waitForExpectations(timeout: 10.0)
    }
    
    
}
