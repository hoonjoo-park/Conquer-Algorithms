import Foundation

func 단지번호붙이기() {
    let n = Int(readLine()!)!
    var grid = [[Int]]()
    var totalCount = 0
    var count = 0
    var counts = [Int]()
    
    for _ in 0..<n {
        let row = readLine()!.map { Int(String($0))! }
        grid.append(row)
    }
    
    for row in 0..<n {
        for col in 0..<n {
            guard grid[row][col] == 1 else { continue }
            count = 0
            totalCount += 1
            
            dfs(row, col)
            counts.append(count)
        }
    }
    
    func dfs(_ row: Int, _ col: Int) {
        if row < 0 || row >= n || col < 0 || col >= n { return }
        
        guard grid[row][col] == 1 else { return }
        
        grid[row][col] = 0
        count += 1
        
        dfs(row - 1, col)
        dfs(row, col + 1)
        dfs(row + 1, col)
        dfs(row, col - 1)
    }
    
    print(totalCount)
    counts.sorted().forEach { print($0) }
}

