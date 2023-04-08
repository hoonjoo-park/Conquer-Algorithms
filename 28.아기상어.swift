import Foundation

func 아기상어() {
    typealias Shark = (row: Int, col: Int, distance: Int)
    let directions = [(-1, 0), (0, 1), (1, 0), (0, -1)]
    
    let n = Int(readLine()!)!
    var grid = [[Int]]()
    var shark: Shark = (row: 0, col: 0, distance: 0)
    var eatenCount = 0
    var sharkSize = 2
    
    for i in 0..<n {
        let row = readLine()!.split(separator: " ").map { Int(String($0))! }
        grid.append(row)
        
        for j in 0..<n {
            if grid[i][j] == 9 {
                shark = (row: i, col: j, distance: 0)
                grid[i][j] = 0
                break
            }
        }
    }
    
    var hasEaten = true
    
    // while문 내에서 변경사항이 아예 없으면 while문을 종료한다. (더 먹을 수 있는 물고기들이 없다는 뜻)
    while hasEaten {
        hasEaten = false
        
        // 초기 세팅 (이 while문 한 사이클이 돌면 상어의 위치와 물고기들이 변화된 grid, 그리고 상어의 상태(size와 먹은 개수)만 변경되고 재시작 하는 것임
        var visited = Array(repeating: Array(repeating: false, count: n), count: n)
        var queue = [Shark]()
        queue.append(shark)
        visited[shark.row][shark.col] = true
        
        // 처음에는 최대 row인 20, 그리고 distance는 아래 조건문에 걸리지 않도록 -1로 세팅해준다.
        var tempShark = (row: 20, col: 0, distance: -1)
        
        // 이제 상어의 사냥이 시작된다.
        while !queue.isEmpty {
            let current: Shark = queue.removeFirst()
            
            // 첫 시도가 아니고 && tempShark의 거리가 current의 거리보다 짧으면 break를 해준다 (더 가까운 것을 먹고 사이클이 종료되니까)
            if tempShark.distance != -1 && tempShark.distance < current.distance { break }
            
            // 현재 위치의 물고기면서, sharkSize보다 작으면 먹는다.
            if grid[current.row][current.col] != 0 && grid[current.row][current.col] < sharkSize {
                hasEaten = true
                // 만약, tempShark가 current보다 위에 있거나, 둘의 row는 같은데 tempShark가 더 왼쪽에 있다면 더 짧은 위치를 선택해야 하므로, tempShark를 current로 대체해준다.
                if tempShark.row > current.row || (tempShark.row == current.row && tempShark.col > current.col) {
                    tempShark = current
                }
            }
            
            // 상하좌우 순회
            for (dx, dy) in directions {
                let nextRow = current.row + dx
                let nextCol = current.col + dy
                let nextDistance = current.distance + 1
                
                if nextRow < 0 || nextRow >= n || nextCol < 0 || nextCol >= n { continue }
                
                // 방문한적 없고, 자신보다 작거나 같으면 일단 이동시킨다 (사이즈가 같은 경우, 먹지는 못해도 이동은 가능하니까)
                if !visited[nextRow][nextCol] && sharkSize >= grid[nextRow][nextCol] {
                    visited[nextRow][nextCol] = true
                    queue.append((row: nextRow, col: nextCol, distance: nextDistance))
                }
            }
        }
        
        // 위의 사이클이 한 번 돌았는데, 상어가 식사를 했다면 아래의 처리들을 해줘야 한다. (사이즈, 먹은 개수, 상어의 위치 갱신)
        if hasEaten {
            shark = tempShark
            eatenCount += 1
            
            if eatenCount == sharkSize {
                sharkSize += 1
                eatenCount = 0
            }
            grid[shark.row][shark.col] = 0
        }
    }
    
    print(shark.distance)
}

// [문제 조건]
// 출력해야 하는 것: 먹이를 스스로 먹을 수 있는 최대 초
// 0: 빈 칸
// 1~6: 물고기들
// 9: 아기 상어의 초기 위치 (아기 상어의 첫 크기는 2)
// 아기 상어는 자신의 크기만큼의 물고기 개수를 먹으면 크기가 1 성장한다.
