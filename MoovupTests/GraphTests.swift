//
//  GraphTests.swift
//  Moovup
//
//  Created by Ding Lo on 12/3/2024.
//

import XCTest
@testable import Moovup

final class GraphTests: XCTestCase {
    
    fileprivate var graph: Graph?
    
    override func setUp() {
        graph = Graph()
        graph?.addEdge("A", "B")
        graph?.addEdge("A", "C")
        graph?.addEdge("B", "D")
        graph?.addEdge("B", "E")
        graph?.addEdge("C", "F")
        graph?.addEdge("D", "G")
        graph?.addEdge("E", "G")
        graph?.addEdge("F", "H")
        graph?.addEdge("G", "H")
    }
    
    func testGetAllPaths() {
        let expectedPaths: [[Character]] = [
            ["A", "B", "D", "G", "H"],
            ["A", "B", "E", "G", "H"],
            ["A", "C", "F", "H"]
        ]
        
        guard let allPaths = graph?.getAllPaths(from: "A", to: "H") else { return }
        
        XCTAssertEqual(allPaths.count, expectedPaths.count)
        
        for path in allPaths {
            XCTAssertTrue(expectedPaths.contains(path))
        }
    }
    
    func testGetShortestPath() {
        let expectedShortestPath: [Character] = ["A", "C", "F", "H"]
        
        guard let shortestPath = graph?.getShortestPath(from: "A", to: "H") else { return }
        
        XCTAssertNotNil(shortestPath)
        XCTAssertEqual(shortestPath, expectedShortestPath)
    }
    
    func testGetShortestPath_NoPath() {
        let shortestPath = graph?.getShortestPath(from: "A", to: "Z")
        
        XCTAssertNil(shortestPath)
    }
}
