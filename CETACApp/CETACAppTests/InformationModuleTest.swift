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
    
    func testWithError() throws {
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
            if let err = err {
                XCTAssertNil(err)
            }
        }
    }
    
    
}
