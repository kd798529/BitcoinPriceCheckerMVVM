//
//  BitcoinPriceCheckerTests.swift
//  BitcoinPriceCheckerTests
//
//  Created by Leng Trang on 2/24/23.
//

import XCTest
@testable import BitcoinPriceChecker

final class BitcoinPriceCheckerTests: XCTestCase {
    let mockBitCoinViewController: BTCViewController = BTCViewController()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testCurrencyFormatter() throws {
        let usd = CurrencyUtility.formattedCurrency(currencyType: .usd, currencyData: ["USD": 0.00])
        XCTAssertTrue(usd == "$0.00")
        
        let eur = CurrencyUtility.formattedCurrency(currencyType: .eur, currencyData: ["EUR": 0.00])
        XCTAssertTrue(eur == "€0.00")

        let jpy = CurrencyUtility.formattedCurrency(currencyType: .jpy, currencyData: ["JPY": 0.00])
        XCTAssertTrue(jpy == "¥0")
    }

}
