//
//  AssignmentUITests.swift
//  AssignmentUITests
//
//  Created by Cooldown on 21/8/18.
//  Copyright © 2018 Cooldown. All rights reserved.
//

import XCTest

class AssignmentUITests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let app = XCUIApplication()
        app.buttons["Add"].tap()
        //let timePicker : XCUIElement = app.datePickers["timePicker"];
        //app.datePickers["]
        app.pickerWheels.element(boundBy: 0).adjust(toPickerWheelValue: "11")
        app.pickerWheels.element(boundBy: 1).adjust(toPickerWheelValue: "59")
        app.pickerWheels.element(boundBy: 2).adjust(toPickerWheelValue: "PM")
        app.buttons["Repeat"].tap()
        app.tables["weeksdayTable"].staticTexts["Every Monday"].tap()
        app.buttons["Done"].tap()
        app.buttons["Alarm Method"].tap()
        app.tables["tableViewMethod"].cells.element(boundBy: 0).tap()
        let cell = app.tables["alarmPICtv"].cells
        cell.element(boundBy: 0).tap()
        app.buttons["Save"].tap()
        app.tables["tableViewMethod"].cells.element(boundBy: 0).tap()
        cell.element(boundBy: cell.count-1).tap()
        addUIInterruptionMonitor(withDescription: "Notification Permissions") { (alert) -> Bool in
            let button = alert.buttons["actionPhoto"]
            if button.exists {
                button.tap()
                return true
            }
            return false
        }
        app.tap()
        app.buttons["Back"].tap()
        app.buttons["Back"].tap()
        app.buttons["Save"].tap()
        let cell1 = app.tables["VCC"].cells
        cell1.element(boundBy: cell1.count-1).swipeLeft()
        cell1.element(boundBy: cell1.count-1).buttons["Delete"].tap()
        
    }
    func testDisplaySoundName(){
        let app = XCUIApplication()
        app.launch()
        app.buttons["Sound"].tap()
        
        //Assert that we are displaying the tableView
        let soundTableView = app.tables["table--soundNames"]
        
        XCTAssert(soundTableView.exists, "The sound tableview exists")
        
        let tableCells = soundTableView.cells
        
        if tableCells.count > 0 {
            let count: Int = (tableCells.count-1)
            let promise = expectation(description: "Wait for table cells")
            for i in stride(from: 0, to: count, by: 1){
                let tableCell = tableCells.element(boundBy: i)
                XCTAssertTrue(tableCell.exists, "The \(i) cell is in place on the table")
                tableCell.tap()
                XCTAssertEqual(app.layoutItems["soundName"].label,tableCell.textViews.accessibilityLabel)
                if i == (count - 1 ){
                    promise.fulfill()
                }
                //Back
                app.navigationBars.buttons.element(boundBy: 0).tap()
                
            }
            waitForExpectations(timeout: 20, handler: nil)
            XCTAssertTrue(true, "Finished validating the table cells")
        }
        else {
            XCTAssert(false, "Could not find any table cells")
        }
    }
    func testDisplayMethod(){
        let app = XCUIApplication()
        app.launch()
        app.buttons["Methods"].tap()
        let methodTableView = app.tables["table--methodNames"]
        
        XCTAssert(methodTableView.exists, "The methods tableview exists")
        
        let tableCells = methodTableView.cells
        
        if tableCells.count > 0 {
            let count: Int = (tableCells.count-1)
            let promise = expectation(description: "Wait for table cells")
            for i in stride(from: 0, to: count, by: 1){
                let tableCell = tableCells.element(boundBy: i)
                XCTAssertTrue(tableCell.exists, "The \(i) cell is in place on the table")
                tableCell.tap()
                XCTAssertEqual(app.layoutItems["methodNames"].label,tableCell.textViews.accessibilityLabel)
                if i == (count - 1 ){
                    promise.fulfill()
                }
                //Back
                app.navigationBars.buttons.element(boundBy: 0).tap()
                
            }
            waitForExpectations(timeout: 20, handler: nil)
            XCTAssertTrue(true, "Finished validating the table cells")
        }
        else {
            XCTAssert(false, "Could not find any table cells")
        }
        
    }
    func testDisplayRepatDays(){
        let app = XCUIApplication()
        app.launch()
        app.buttons["Repeat"].tap()
        let repeatTableView = app.tables["table--repeatDays"]
        
        XCTAssert(repeatTableView.exists, "The repeat days tableview exists")
        
        let tableCells = repeatTableView.cells
        
        if tableCells.count > 0 {
            let count: Int = (tableCells.count-1)
            let promise = expectation(description: "Wait for table cells")
            for i in stride(from: 0, to: count, by: 1){
                let tableCell = tableCells.element(boundBy: i)
                XCTAssertTrue(tableCell.exists, "The \(i) cell is in place on the table")
                tableCell.tap()
                XCTAssertEqual(app.layoutItems["repeatDays"].label,tableCell.textViews.accessibilityLabel)
                if i == (count - 1 ){
                    promise.fulfill()
                }
                //Back
                app.navigationBars.buttons.element(boundBy: 0).tap()
                
            }
            waitForExpectations(timeout: 20, handler: nil)
            XCTAssertTrue(true, "Finished validating the table cells")
        }
        else {
            XCTAssert(false, "Could not find any table cells")
        }
        
    }
}
