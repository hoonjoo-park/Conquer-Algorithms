import Foundation

func 연구소() {
    let directions = [(-1, 0), (0, 1), (1, 0), (0, -1)]
    
    let firstLine = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (n, m) = (firstLine[0], firstLine[1])
    var grid = [[Int]]()
    var spaces = [(Int, Int)]()
    var maxSafeArea = Int.min
    
    for i in 0..<n {
        let row = readLine()!.split(separator: " ").map { Int(String($0))! }
        grid.append(row)
        
        for j in 0..<m {
            if grid[i][j] == 0 {
                spaces.append((row: i, col: j))
            }
        }
    }
    
    func getSafeAreaCount(_ lab: [[Int]]) -> Int {
        var safeAreaCount = 0
        
        for row in 0..<n {
            for col in 0..<m {
                if lab[row][col] == 0 {
                    safeAreaCount += 1
                }
            }
        }
        
        return safeAreaCount
    }
    
    func bfs(_ lab: [[Int]]) {
        var queue = [(Int,Int)]()
        var lab = lab
        
        for i in 0..<n {
            for j in 0..<m {
                if lab[i][j] == 2 {
                    queue.append((i, j))
                }
            }
        }
        
        while !queue.isEmpty {
            let (row, col) = queue.removeFirst()
            
            for (dx, dy) in directions {
                let nextRow = row + dx
                let nextCol = col + dy
                
                if nextRow < 0 || nextRow >= n || nextCol < 0 || nextCol >= m { continue }
                
                guard lab[nextRow][nextCol] == 0 else { continue }
                
                lab[nextRow][nextCol] = 2
                queue.append((nextRow, nextCol))
            }
        }
        
        maxSafeArea = max(maxSafeArea, getSafeAreaCount(lab))
    }
    
    func makeCombinations(_ combination: [(Int, Int)], _ rest: [(Int, Int)]) {
        if combination.count == 3 {
            var lab = grid
            
            combination.forEach { lab[$0][$1] = 1 }
            bfs(lab)
            
            return
        }
        
        for (i, point) in rest.enumerated() {
            var combination = combination
            var rest = rest
            
            combination.append(point)
            rest.remove(at: i)
            makeCombinations(combination, rest)
        }
    }
    
    makeCombinations([], spaces)
    
    print(maxSafeArea)
}


// 조건
// 0: 빈 칸, 1: 벽, 2: 바이러스
// n: 행
// m: 열
// 임의의 위치에 벽 3개를 세웠을 때, 가장 큰 안전영역(0)을 출력한다.

// 로직
// 1. grid를 모두 탐색하여 바이러스의 위치를 bfs의 시작점으로 잡는다.
// 2. 0에만 벽을 세울 수 있으므로, 0 중에 3개를 뽑아 벽을 세울 수 있는 경우에 대한 조합을 만든다.
// 3. 그리고 그 조합에 대한 위치에 벽을 세운다.
// 4. 이제 각 벽세우기 조합에 대한 bfs를 돌려서 가장 많은 0의 개수를 반환해주면 된다.

// 구현 플로우
// 1. space의 모든 Point를 구해놓는다. (spaces)
// 2. spaces를 통해 3개의 조합을 만든다.

