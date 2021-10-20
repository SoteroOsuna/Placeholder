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
    
//    func testWithError() throws {
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//        let username = "sotosuna@cetacmobile.com"
//        let password = "1234567"
//        Auth.auth().signIn(withEmail: username, password: password) { (result, error) in
//            if (error != nil) {
//                XCTAssertNil(error)
//            }
//        }
//    }
    
    func testFirebaseConection() throws {
        let db = Firestore.firestore()
        db.collection("Usuarios").getDocuments()  { (querySnapshot, err) in
            if let err = err {
                XCTAssertNil(err)
            }
        }
    }
    
//    Correct Data
    func testAuthentication1() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let username = "sotosuna@cetacmobile.com"
        let password = "123456"
        let expectedUID = "PCrXzIkXcyOgeUwml8vok4x2u422"
        let exp = self.expectation(description: "AuthTest")
        Auth.auth().signIn(withEmail: username, password: password) { (result, error) in
            if (error != nil) {
                XCTAssertNil(error)
            } else {
                XCTAssertEqual(expectedUID, result!.user.uid)
            }
            exp.fulfill()
        }
        self.waitForExpectations(timeout: 10.0)
    }
    
//    Incorrect Password, correct Username
    func testAuthentication2() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let username = "sotosuna@cetacmobile.com"
        let password = "1234567"
        let expectedUID = "PCrXzIkXcyOgeUwml8vok4x2u422"
        let exp = self.expectation(description: "AuthTest")
        Auth.auth().signIn(withEmail: username, password: password) { (result, error) in
            if (error != nil) {
                XCTAssertNotNil(error)
            } else {
                XCTAssertNotEqual(expectedUID, result!.user.uid)
            }
            exp.fulfill()
        }
        self.waitForExpectations(timeout: 10.0)
    }
    
//    Incorrect Username, correct Password
    func testAuthentication3() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let username = "sotosunag@cetacmobile.com"
        let password = "123456"
        let expectedUID = "PCrXzIkXcyOgeUwml8vok4x2u422"
        let exp = self.expectation(description: "AuthTest")
        Auth.auth().signIn(withEmail: username, password: password) { (result, error) in
            if (error != nil) {
                XCTAssertNotNil(error)
            } else {
                XCTAssertNotEqual(expectedUID, result!.user.uid)
            }
            exp.fulfill()
        }
        self.waitForExpectations(timeout: 10.0)
    }
    
//    Incorrect Username (not existent), Incorrect Password
    func testAuthentication4() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let username = "sotosunag@cetacmobile.com"
        let password = "1234567"
        let expectedUID = "PCrXzIkXcyOgeUwml8vok4x2u422"
        let exp = self.expectation(description: "AuthTest")
        Auth.auth().signIn(withEmail: username, password: password) { (result, error) in
            if (error != nil) {
                XCTAssertNotNil(error)
            } else {
                XCTAssertNotEqual(expectedUID, result!.user.uid)
            }
            exp.fulfill()
        }
        self.waitForExpectations(timeout: 10.0)
    }
    

}
