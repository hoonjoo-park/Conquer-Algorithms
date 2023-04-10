import Foundation

func 적록색약() {
    enum PersonType: String {
        case normal = "normal"
        case weakness = "weakness"
    }
    
    let directions = [(-1, 0), (0, 1), (1, 0), (0, -1)]
    let RGB = ["R", "G", "B"]
    
    let n = Int(readLine()!)!
    var grid = [[String]]()
    var normalCount = 0
    var weaknessCount = 0
    
    for _ in 0..<n {
        let row = readLine()!.map { String($0) }
        grid.append(row)
    }
    
    func findColorArea(_ type: PersonType) {
        var colors = grid
        
        if type == .weakness {
            for row in 0..<n {
                for col in 0..<n {
                    if colors[row][col] == "G" {
                        colors[row][col] = "R"
                    }
                }
            }
        }
        
        for color in RGB {
            for row in 0..<n {
                for col in 0..<n {
                    if colors[row][col] == color {
                        dfs(row, col, color)
                        colors[row][col] = "X"
                        
                        if type == .normal {
                            normalCount += 1
                        } else {
                            weaknessCount += 1
                        }
                    }
                }
            }
        }
        
        func dfs(_ row: Int, _ col :Int, _ currentColor: String) {
            for (dx, dy) in directions {
                let nextRow = dx + row
                let nextCol = dy + col
                
                if nextRow < 0 || nextRow >= n || nextCol < 0 || nextCol >= n { continue }
                if colors[nextRow][nextCol] != currentColor { continue }
                
                colors[nextRow][nextCol] = "X"
                dfs(nextRow, nextCol, currentColor)
            }
        }
    }
    
    findColorArea(.normal)
    findColorArea(.weakness)
    
    print(normalCount, weaknessCount)
}

// 풀이 로직
// 1. 일반인의 경우와 색약의 경우를 각각 체크해야 한다.
// 2. RGB = ["R", "G", "B"]를 기준으로 루프를 돌린다.
// 3. 일반인의 경우에는 dfs를 돌며 각 영역을 count 해준다. (한 번 dfs로 탐색한 노드들은 "X"로 변환해준다.)
// 4. 색약의 경우, 우선 G들을 모두 R로 바꾼뒤 dfs를 돌려 각 영역을 count 해준다.
// 5. 마지막으로, 각각의 count 수를 반환하며 함수를 종료하면 된다.
