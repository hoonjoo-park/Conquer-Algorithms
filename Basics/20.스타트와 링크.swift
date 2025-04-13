import Foundation

func 스타트와링크() {
    let n = Int(readLine()!)!
    var grid = Array(repeating: Array(repeating: 0, count: n), count: n)
    var visited = Array(repeating: false, count: n)
    var answer = Int.max
    
    for i in 0..<n {
        let row = readLine()!.split(separator: " ").map{Int(String($0))!}
        grid[i] = row
    }
    
    // 메인 로직
    func dfs(_ teamCount: Int, _ startIndex: Int) {
        if teamCount == n/2 {
            var teamA = 0, teamB = 0
            
            for i in 0..<n {
                for j in 0..<n {
                    if visited[i] && visited[j] { teamA += grid[i][j] }
                    if !visited[i] && !visited[j] { teamB += grid[i][j] }
                }
            }
            
            answer = min(answer, abs(teamA - teamB))
            
            return
        }
        
        for i in startIndex+1..<n {
            visited[i] = true
            dfs(teamCount + 1, i)
            visited[i] = false
        }
    }
    
    dfs(0, 0)
    print(answer)
}

// 로직
// 1. 팀을 두개로 나눠야 하는데, 이를 위한 조합만 구하면 된다(순서 필요 없음)
// 2. 두 명씩 뽑아내서 조합별 능력치를 구한다.
