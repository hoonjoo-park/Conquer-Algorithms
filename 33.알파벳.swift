import Foundation

func 알파벳() {
    let directions = [(-1, 0), (0, 1), (1, 0), (0, -1)]
    
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (n, m) = (input[0], input[1])
    var grid = Array(repeating: [Int](), count: n)
    var maxDistance = 0
    
    for i in 0..<n {
        grid[i] = readLine()!.map { Int($0.asciiValue!) - 65 }
    }
    
    func dfs(_ row: Int, _ col: Int, _ distance: Int, _ alphabet: Int) {
        maxDistance = max(maxDistance, distance)
        
        for (dx, dy) in directions {
            let nextRow = row + dx
            let nextX = col + dy
            
            if nextRow < 0 || nextRow >= n || nextX < 0 || nextX >= m { continue }
            
            let n = 1 << grid[nextRow][nextX]
            
            if alphabet & n == 0 {
                dfs(nextRow, nextX, distance + 1, alphabet | n)
            }
        }
    }
    
    dfs(0, 0, 1, 1 << grid[0][0])
    
    print(maxDistance)
}
