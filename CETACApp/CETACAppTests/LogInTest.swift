//
//  LogInTest.swift
//  CETACAppTests
//
//  Created by Sotero Osuna on 10/10/21.
//

import XCTest
import Firebase

@testable import CETACApp

class LogInTest: XCTestCase {
    
    
    func testWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let username = "sotosuna@cetacmobile.com"
        let password = "1234567"
        Auth.auth().signIn(withEmail: username, password: password) { (result, error) in
            if (error != nil) {
                XCTAssertNil(error)
            }
        }
    }

    func testAuthentication() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let username = "sotosuna@cetacmobile.com"
        let password = "123456"
        Auth.auth().signIn(withEmail: username, password: password) { (result, error) in
            if (error != nil) {
                XCTAssertNil(error)
            }
        }
    }
    
    func testFirebaseConection() throws {
        let db = Firestore.firestore()
        db.collection("Usuarios").getDocuments()  { (querySnapshot, err) in
            if let err = err {
                XCTAssertNil(err)
            }
        }
    }

}
