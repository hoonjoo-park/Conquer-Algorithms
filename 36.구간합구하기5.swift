import Foundation

func 구간합구하기5() {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (n ,m) = (input[0], input[1])
    var grid = [[Int]]()
    var sumGrid: [[Int]] = Array(repeating: Array(repeating: 0, count: n+1), count: n+1)
    
    for _ in 0..<n {
        let row = readLine()!.split(separator: " ").map { Int(String($0))! }
        grid.append(row)
    }
    
    for i in 0..<n {
        for j in 0..<n {
            sumGrid[i+1][j+1] = sumGrid[i][j+1] + sumGrid[i+1][j] + grid[i][j] - sumGrid[i][j]
        }
    }
    
    for _ in 0..<m {
        let input = readLine()!.split(separator: " ").map { Int(String($0))! }
        let (x1, y1, x2, y2) = (input[0], input[1], input[2], input[3])
        
        let prefixSum = sumGrid[x2][y2] - sumGrid[x2][y1-1] - sumGrid[x1-1][y2] + sumGrid[x1-1][y1-1]
        print(prefixSum)
    }
}
