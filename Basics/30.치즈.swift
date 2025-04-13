import Foundation

func 치즈() {
    typealias Point = (Int, Int)
    let directions = [(-1, 0), (0, 1), (1, 0), (0, -1)]
    
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (n, m) = (input[0], input[1])
    var grid = [[Int]]()
    var time = 0
    
    for i in 0..<n {
        let row = readLine()!.split(separator: " ").map { Int(String($0))! }
        grid.append(row)
        
        for j in 0..<m {
            if grid[i][j] == 1 { grid[i][j] = 5 }
        }
    }
    
    func bfs() {
        var queue = [Point]()
        var visited = Array(repeating: Array(repeating: false, count: m), count: n)
        
        queue.append((0, 0))
        visited[0][0] = true
        
        while !queue.isEmpty {
            let (row, col) = queue.removeFirst()
            
            for (dx, dy) in directions {
                let nextRow = row + dx
                let nextCol = col + dy
                
                if nextRow < 0 || nextRow >= n || nextCol < 0 || nextCol >= m { continue }
                
                if grid[nextRow][nextCol] != 0 {
                    grid[nextRow][nextCol] -= 1
                    continue
                }
                
                if !visited[nextRow][nextCol] && grid[nextRow][nextCol] == 0 {
                    visited[nextRow][nextCol] = true
                    queue.append((nextRow, nextCol))
                }
            }
        }
    }
    
    func checkCheese() -> Bool {
        var isAllMelted = true
        
        for i in 0..<n {
            for j in 0..<m {
                if grid[i][j] == 0 { continue }
                
                if grid[i][j] <= 3 {
                    grid[i][j] = 0
                } else {
                    grid[i][j] = 5
                    isAllMelted = false
                }
            }
        }
        
        return isAllMelted
    }
    
    while true {
        bfs()
        time += 1
        if checkCheese() { break }
    }
    
    print(time)
}


// 풀이 로직
// 1. 이중 for문을 통해 grid를 순회한다. (0일 때만)
// 2. 0에서 시작해서 bfs를 돌리며 치즈를 찾는다.
// 3. 치즈를 찾으면, 해당 치즈 -= 1을 해준다.
// 4. 빈공간을 모두 탐색했으면, 상한 치즈들을 다시 탐색해준다.
// 5. 상한 치즈들은 4보다 작은 치즈들이다.
// 6. 4보다 작은 치즈들은 0으로 변환해준다. 그리고 그렇지 않은 치즈들은 다시 5로 세팅해준다.
// 7. 이러한 사이클을 치즈가 더이상 발견되지 않을 때까지 계속해준다.
