import Foundation

func 미로탐색() {
    let firstLine = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (n, m) = (firstLine[0], firstLine[1])
    var grid = [[Int]]()
    var minDistance = Int.max
    
    for _ in 0..<n {
        let row = readLine()!.map { Int(String($0))! }
        grid.append(row)
    }
    
    var queue = [(Int, Int, Int)]()
    queue.append((0, 0, 1))
    grid[0][0] = 0
    
    while !queue.isEmpty {
        let (currentRow, currentCol, currentCount) = queue.removeFirst()
        
        if currentRow == n-1 && currentCol == m-1 {
            minDistance = currentCount
            break
        }
        
        let directions = [(-1, 0), (0, 1), (1, 0), (0, -1)]
        
        for (dx, dy) in directions {
            let nextRow = currentRow + dx
            let nextCol = currentCol + dy
            
            if nextRow < 0 || nextRow >= n || nextCol < 0 || nextCol >= m  { continue }
            
            guard grid[nextRow][nextCol] == 1 else { continue }
            
            grid[nextRow][nextCol] = 0
            queue.append((nextRow, nextCol, currentCount + 1))
        }
    }
    
    print(minDistance)
}

// 풀이 로직
// 1. 전형적인 BFS 문제다. (최단 거리를 찾는 문제)
// 2. 상하좌우를 탐색하며 queue를 활용한 BFS로 가장 먼저 도착한 경우의 count를 반환해주면 된다.
