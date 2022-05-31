//
//  CurrencyFormatterTests.swift
//  BankeyUnitTests
//
//  Created by justin on 2022/5/31.
//

import Foundation


import XCTest

@testable import Bankey

class Test: XCTestCase {
    var formatter: CurrencyFormatter!
    
    override func setUp() {
        super.setUp()
        formatter = CurrencyFormatter() // this function gets called once per test
    }
    
    func testShouldBeVisible() throws {
        let result = formatter.breakIntoDollarsAndCents(929466.23)
        XCTAssertEqual(result.0, "929,466")
        XCTAssertEqual(result.1, "23")
    }
    
    func testDollarFormatted() throws {
        let result = formatter.dollarsFormatted(34.12)
        XCTAssertEqual(result, "$34.12")
    }
    
    func testZeroDollarsFormatted() throws {
        let locale = Locale.current
        let currencySymbol = locale.currencySymbol!
        
        let result = formatter.dollarsFormatted(0.00)
        XCTAssertEqual(result, "\(currencySymbol)0.00")
    }
    
}
