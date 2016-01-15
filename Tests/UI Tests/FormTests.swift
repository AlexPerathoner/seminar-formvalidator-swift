//
//  FormTests.swift
//  iOS Example
//
//  Created by Aaron McTavish on 14/01/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import XCTest

class FormTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testTextField_NoAllowedViolations() {
        let app = XCUIApplication()
        let expectedResult = "Foo"
        
        let nameTextField = app.textFields[FormAccessibility.Identifiers.NameTextField]
        nameTextField.tap()
        nameTextField.typeText(expectedResult + "12 ?")
        
        let actualResult = nameTextField.value as? String
        
        XCTAssertEqual(actualResult, expectedResult, "The text field should have text \(expectedResult) but received \(actualResult).")
    }
    
    func testTextField_AllowedViolations() {
        let app = XCUIApplication()
        let expectedResult = "Foo12 ?"
        
        let emailTextField = app.textFields[FormAccessibility.Identifiers.EmailTextField]
        emailTextField.tap()
        emailTextField.typeText(expectedResult)
        
        let actualResult = emailTextField.value as? String
        
        XCTAssertEqual(actualResult, expectedResult, "The text field should have text \(expectedResult) but received \(actualResult).")
    }
    
    func testForm_Valid() {
        let app = XCUIApplication()
        
        let name = "Foo"
        let email = "Bar@Baz.com"
        
        let nameTextField = app.textFields[FormAccessibility.Identifiers.NameTextField]
        let emailTextField = app.textFields[FormAccessibility.Identifiers.EmailTextField]
        let submitButton = app.buttons[FormAccessibility.Identifiers.SubmitButton]
        
        nameTextField.tap()
        nameTextField.typeText(name)
        
        emailTextField.tap()
        emailTextField.typeText(email)
        
        let successAlert = app.staticTexts[NSLocalizedString("Success", comment: "")]
        let exists = NSPredicate(format: "exists == true")
        expectationForPredicate(exists, evaluatedWithObject: successAlert, handler: nil)
        
        submitButton.tap()
        
        waitForExpectationsWithTimeout(5.0, handler: nil)
    }
    
    func testForm_Invalid() {
        let app = XCUIApplication()
        
        let name = "Foo"
        let email = "Bar"
        
        let nameTextField = app.textFields[FormAccessibility.Identifiers.NameTextField]
        let emailTextField = app.textFields[FormAccessibility.Identifiers.EmailTextField]
        let submitButton = app.buttons[FormAccessibility.Identifiers.SubmitButton]
        
        nameTextField.tap()
        nameTextField.typeText(name)
        
        emailTextField.tap()
        emailTextField.typeText(email)
        
        let successAlert = app.staticTexts[NSLocalizedString("Error", comment: "")]
        let exists = NSPredicate(format: "exists == true")
        expectationForPredicate(exists, evaluatedWithObject: successAlert, handler: nil)
        
        submitButton.tap()
        
        waitForExpectationsWithTimeout(5.0, handler: nil)
    }
    
}
