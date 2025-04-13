import Foundation

func 안전영역() {
    let directions = [(-1, 0), (0, 1), (1, 0), (0, -1)]
    
    let n = Int(readLine()!)!
    var grid = [[Int]]()
    var heightSet = Set<Int>()
    var maxSafeArea = 1
    
    for _ in 0..<n {
        let row = readLine()!.split(separator: " ").map { Int(String($0))! }
        grid.append(row)
        
        for height in row {
            heightSet.insert(height)
        }
    }
    
    for height in Array(heightSet).sorted() {
        floodFill(height)
    }
    
    func floodFill(_ height: Int) {
        var city = grid
        
        for row in 0..<n {
            for col in 0..<n {
                if city[row][col] <= height {
                    city[row][col] = 0
                }
            }
        }
        
        countSafeArea(city)
    }
    
    func countSafeArea(_ city: [[Int]]) {
        var city = city
        var count = 0
        
        for row in 0..<n {
            for col in 0..<n {
                if city[row][col] != 0 {
                    city[row][col] = 0
                    dfs(row, col)
                    count += 1
                }
            }
        }
        
        func dfs(_ row: Int, _ col: Int) {
            for (dx, dy) in directions {
                let nextRow = dx + row
                let nextCol = dy + col
                
                if nextRow < 0 || nextRow >= n || nextCol < 0 || nextCol >= n { continue }
                
                if city[nextRow][nextCol] != 0 {
                    city[nextRow][nextCol] = 0
                    dfs(nextRow, nextCol)
                }
            }
        }
        
        maxSafeArea = max(maxSafeArea, count)
    }
    
    print(maxSafeArea)
}


// 풀이 로직
// 1. 모든 height들을 Set 컬렉션에 담아준다.
// 2. 오름차순으로 정렬된 height들을 기준으로 모두 순회한다.
// 3. 각 사이클마다 해당 height보다 작거나 같은 지역을 모두 0으로 변환해준다.
// 4. 변환된 city를 기준으로 dfs를 돌려 안전영역을 카운팅 해준 뒤 -> maxSafeArea를 갱신해준다.
// 4. 최종적으로 maxSafeArea를 반환하며 함수를 종료한다.
