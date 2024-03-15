//
//  APIManagerTests.swift
//  MoovupTests
//
//  Created by Ding Lo on 15/3/2024.
//

import XCTest
@testable import Moovup

class APIManagerTests: XCTestCase {
    func testFetchPeopleListAPI() {
        // Create an expectation to wait for the asynchronous completion block
        let expectation = XCTestExpectation(description: "Fetch people list")

        // Create a mock URLSession that returns predefined data and response
        let mockSession = MockURLSession()
        let responseData = """
            {
                "people": [
                    {
                        "name": "John Doe",
                        "age": 30
                    },
                    {
                        "name": "Jane Smith",
                        "age": 25
                    }
                ]
            }
            """.data(using: .utf8)
        let response = HTTPURLResponse(url: URL(string: "https://api.json-generator.com/")!, statusCode: 200, httpVersion: nil, headerFields: nil)
        mockSession.data = responseData
        mockSession.response = response
        mockSession.error = nil

        // Perform the API request
        APIManager.shared.fetchPeopleListAPI { result in
            switch result {
            case .success(let userResponse):
                // Verify the returned userResponse matches your expectations
                // You can use XCTAssert functions to perform the verification

                // Fulfill the expectation since the completion block has been called
                expectation.fulfill()
            case .failure(let error):
                // Handle the failure case or use XCTAssert to fail the test
                XCTFail("API request failed with error: \(error)")
            }
        }

        // Wait for the expectation to be fulfilled within a certain timeout
        wait(for: [expectation], timeout: 5.0)
    }
}

// Mock URLSession for testing purposes
class MockURLSession: URLSession {
    var data: Data?
    var response: URLResponse?
    var error: Error?

    override func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return MockURLSessionDataTask {
            completionHandler(self.data, self.response, self.error)
        }
    }
}

// Mock URLSessionDataTask for testing purposes
class MockURLSessionDataTask: URLSessionDataTask {
    private let closure: () -> Void

    init(closure: @escaping () -> Void) {
        self.closure = closure
        super.init()
    }

    override func resume() {
        closure()
    }
}
