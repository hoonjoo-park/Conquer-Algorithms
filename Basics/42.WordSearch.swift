import Foundation

func exist(_ board: [[Character]], _ word: String) -> Bool {
    guard board.count != 0, board[0].count != 0, word.count != 0 else { return false }
    
    let word = Array(word)
    let maxRow = board.count
    let maxCol = board[0].count
    var visited = Array(repeating: Array(repeating: false, count: maxCol), count: maxRow)
    
    for row in 0..<maxRow {
        for col in 0..<maxCol where board[row][col] == word.first {
            if check(row, col, 0) { return true }
        }
    }
    
    func check(_ row: Int, _ col: Int, _ index: Int) -> Bool {
        guard index < word.count else { return true }
        
        if row < 0 || row >= maxRow || col < 0 || col >= maxCol { return false }
        
        guard !visited[row][col], board[row][col] == word[index] else { return false }
        
        visited[row][col] = true
        
        let hasFoundWord =  check(row-1, col, index+1) || check(row+1, col, index+1) || check(row, col-1, index+1) || check(row, col+1, index+1)
        
        visited[row][col] = false
        
        return hasFoundWord
    }
    
    return false
}



// [풀이 로직]
// 1. for문으로 board를 순회하며 word의 첫 자리와 같은 node를 찾는다.
// 2. 이 때, 백트래킹 함수를 통해 word를 찾을 수 있는지 체크한다.
// 3. 만약 for문이 종료됐는데도 word를 찾지 못했다면 false를 반환하며 함수를 종료한다.
