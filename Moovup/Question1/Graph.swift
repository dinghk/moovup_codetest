//
//  Graph.swift
//  Moovup
//
//  Created by Ding Lo on 12/3/2024.
//

import Foundation

class Graph {
    private var adjacencyList: [Character: [Character]]

    init() {
        adjacencyList = [:]
    }

    func addEdge(_ source: Character, _ destination: Character) {
        if adjacencyList[source] == nil {
            adjacencyList[source] = []
        }
        adjacencyList[source]?.append(destination)

        if adjacencyList[destination] == nil {
            adjacencyList[destination] = []
        }
        adjacencyList[destination]?.append(source)
    }

    func getAllPaths(from source: Character, to destination: Character) -> [[Character]] {
        var visited: Set<Character> = []
        var paths: [[Character]] = []
        var currentPath: [Character] = []

        dfs(source, destination, &visited, &paths, &currentPath)

        return paths
    }

    private func dfs(_ current: Character, _ destination: Character, _ visited: inout Set<Character>, _ paths: inout [[Character]], _ currentPath: inout [Character]) {
        visited.insert(current)
        currentPath.append(current)

        if current == destination {
            paths.append(currentPath)
        } else {
            if let neighbors = adjacencyList[current] {
                for neighbor in neighbors {
                    if !visited.contains(neighbor) {
                        dfs(neighbor, destination, &visited, &paths, &currentPath)
                    }
                }
            }
        }

        // Backtrack
        currentPath.removeLast()
        visited.remove(current)
    }

    func getShortestPath(from source: Character, to destination: Character) -> [Character]? {
        var visited: Set<Character> = []
        var queue: [(node: Character, path: [Character])] = []
        queue.append((source, [source]))

        while !queue.isEmpty {
            let (current, path) = queue.removeFirst()

            if current == destination {
                return path
            }

            visited.insert(current)

            if let neighbors = adjacencyList[current] {
                for neighbor in neighbors {
                    if !visited.contains(neighbor) {
                        var newPath = path
                        newPath.append(neighbor)
                        queue.append((neighbor, newPath))
                    }
                }
            }
        }

        return nil
    }
}
