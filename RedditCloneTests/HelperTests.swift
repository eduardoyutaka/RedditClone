//
//  HelperTests.swift
//  RedditCloneTests
//
//  Created by Eduardo Yutaka Nakanishi on 15/10/2020.
//

import XCTest

class HelperTests: XCTestCase {

    func testFormatUsername() throws {
        let username = "eduardoyutaka"
        XCTAssert(Helper.formatUsername(username) == "u/eduardoyutaka")
    }
    
    func testFormatElapsedTimeInHoursSmallValue() throws {
        let elapsedTimeInHours = 12
        XCTAssert(Helper.formatElapsedTimeInHours(elapsedTimeInHours) == "12h")
    }
    
    func testFormatElapsedTimeInHoursLargeValue() throws {
        let elapsedTimeInHours = 48
        XCTAssert(Helper.formatElapsedTimeInHours(elapsedTimeInHours) == "2d")
    }

}
