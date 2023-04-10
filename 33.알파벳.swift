import Foundation

func 알파벳() {
    let directions = [(-1, 0), (0, 1), (1, 0), (0, -1)]
    
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (n, m) = (input[0], input[1])
    var grid = Array(repeating: [Int](), count: n)
    var maxDistance = 1
    
    for i in 0..<n {
        // 대문자 A의 아스키코드 값이 65이므로, 입력받은 대문자 알파벳들에서 65를 빼주면,
        // 모든 알파벳 입력값들이 0~25로 표현된다.
        grid[i] = readLine()!.map { Int($0.asciiValue!) - 65 }
    }
    
    func dfs(_ row: Int, _ col: Int, _ distance: Int, _ alphabet: Int) {
        for (dx, dy) in directions {
            let nextRow = row + dx
            let nextX = col + dy
            
            if nextRow < 0 || nextRow >= n || nextX < 0 || nextX >= m { continue }
            
            // 다음 알파벳을 비트로 표현한다. C라면 "100" F라면 "100000"가 될 것이다.
            let n = 1 << grid[nextRow][nextX]
            
            // AND 연산을 통해 중복을 체크한다. AND 연산은 둘 다 1일 때만 1을 반환한다.
            // 따라서, 아래의 AND 연산 결과가 0이 아니라면 중복되는 값이 있다는 것이다. (0이면 중복 없다는 것)
            if alphabet & n == 0 {
                // 따라서, 중복되는 것이 없으면 OR 연산으로 둘을 합쳐준다.
                dfs(nextRow, nextX, distance + 1, alphabet | n)
            }
        }
        
        maxDistance = max(maxDistance, distance)
    }
    
    dfs(0, 0, 1, 1 << grid[0][0])
    
    print(maxDistance)
}

// 비트마스킹으로 풀지 않으면 시간 초과가 난다...
// Set랑 배열, 문자열 모두를 사용해봤는데 다 시간 초과가 나서, 결국 비트마스킹 사용을 하게 됐다.
