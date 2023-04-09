import Foundation

func 다리만들기() {
    typealias Point = (Int, Int)
    let directions = [(-1, 0), (0, 1), (1, 0), (0, -1)]
    
    let n = Int(readLine()!)!
    var grid: [[Int]] = []
    var minDistance = Int.max
    var label = 1
    
    for _ in 0..<n {
        let row = readLine()!.split { $0 == " " }.map { Int(String($0))! }
        grid.append(row)
    }
    
    func paintIsland(_ startRow: Int, _ startCol: Int, _ label: Int) {
        var queue: [Point] = [(startRow, startCol)]
        grid[startRow][startCol] = label
        
        while !queue.isEmpty {
            let (row, col) = queue.removeFirst()
            
            for (dx, dy) in directions {
                let nextRow = row + dx
                let nextCol = col + dy
                
                if nextRow < 0 || nextRow >= n || nextCol < 0 || nextCol >= n { continue }
                
                if grid[nextRow][nextCol] != 1 { continue }
                
                grid[nextRow][nextCol] = label
                queue.append((nextRow, nextCol))
            }
        }
    }
    
    func findShortestBridge(_ startRow: Int, _ startCol: Int, _ startLabel: Int) {
        var queue = [(Int, Int, Int)]()
        var visited = Array(repeating: Array(repeating: false, count: n), count: n)
        
        queue.append((startRow, startCol, 0))
        visited[startRow][startCol] = true
        
        while !queue.isEmpty {
            let (row, col, distance) = queue.removeFirst()
            
            for (dx, dy) in directions {
                let nextRow = row + dx
                let nextCol = col + dy
                let nextDistance = distance + 1
                
                if nextRow < 0 || nextRow >= n || nextCol < 0 || nextCol >= n { continue }
                
                if grid[nextRow][nextCol] == startLabel || visited[nextRow][nextCol] { continue }
                
                if grid[nextRow][nextCol] != 0 {
                    minDistance = min(minDistance, distance)
                    break
                }
                
                visited[nextRow][nextCol] = true
                queue.append((nextRow, nextCol, nextDistance))
            }
        }
    }
    
    for i in 0..<n {
        for j in 0..<n {
            if grid[i][j] != 1 { continue }
            label += 1
            paintIsland(i, j, label)
        }
    }
    
    for i in 0..<n {
        for j in 0..<n {
            if grid[i][j] == 0 { continue }
            findShortestBridge(i, j, grid[i][j])
        }
    }
    
    print(minDistance)
}

// 풀이 로직
// 1. 육지(1)를 기준으로 bfs를 통해 순회한다.
// 2. 육지를 라벨링 해준다. (숫자 변경)
// 3. 만약 다음 node가 바다면, 해당 위치를 edges에 저장한다.
