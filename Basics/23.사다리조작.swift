import Foundation

func 사다리조작() {
    let firstLine = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (n, m, h) = (firstLine[0], firstLine[1], firstLine[2])
    var ladder = Array(repeating: Array(repeating: false, count: n + 1), count: h + 1)
    var answer = 4
    
    for _ in 0..<m {
        let line = readLine()!.split(separator: " ").map { Int($0)! }
        let (row, col) = (line[0], line[1])
        
        ladder[row][col] = true
    }
    
    func checkLadder() -> Bool {
        for i in 1...n {
            var position = i
            
            for j in 1...h {
                // 내 현재 위치에 점이 있으면 우측으로 한 칸 이동
                if ladder[j][position] {
                    position += 1
                // 내 왼쪽에 점이 있으면 좌측으로 한 칸 이동
                } else if ladder[j][position - 1] {
                    position -= 1
                }
            }
            // 도착 지점이 i가 아니면 조작에 실패한 것이기 때문에 false 반환
            if position != i { return false }
        }
        
        return true
    }
    
    func dfs(_ count: Int, _ row: Int, _ col: Int) {
        if count >= answer { return }
        
        if checkLadder() {
            answer = count
            return
        }
        // count가 3이 된 순간부터는 그 이상을 검토해볼 필요가 없다.(최대치이기 때문에)
        if count == 3 { return }
        
        var col = col
        
        for i in row...h {
            for j in col..<n {
                if !ladder[i][j] && !ladder[i][j-1] && !ladder[i][j+1] {
                    ladder[i][j] = true
                    dfs(count + 1, i, j)
                    ladder[i][j] = false
                }
            }
            col = 1
        }
    }
    
    dfs(0, 1, 1)
    
    print(answer > 3 ? -1 : answer)
}

// 문제 Input
// 세로 선의 개수: n
// 가로 선의 개수: m
// 가로 점선의 개수: h

// 풀이 로직
// 1. H의 조합들을 만드는 함수가 필요하다. (3보다 많이 조작할 수 없으므로, 조합의 최대 길이는 3이다.)
// 2. H 조합별 검증 함수가 필요하다. (i 사다리의 결과가 i가 나오는지 검증)
// 3. 만약 검증 결과가 true라면, minCount를 업데이트 해줘야 한다. (h 조합의 길이)

