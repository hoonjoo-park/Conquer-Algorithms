func generate(_ numRows: Int) -> [[Int]] {
    var answer = [[Int]]()
    
    for i in 0..<numRows {
        let row = [Int](repeating: 0, count: i + 1)
        answer.append(row)
        
        for j in 0..<row.count {
            if j == 0 || j == row.count-1 {
                answer[i][j] = 1
                continue
            }
            
            answer[i][j] = answer[i-1][j-1] + answer[i-1][j]
        }
    }
    
    
    return answer
}

// 1. numRow만큼 for loop를 돌린다.
// 2. i 길이만큼의 0으로 채워진 배열을 만든다.
// 3. 그리고 그 배열만큼 다시 for loop를 돌린다.
// 4. j가 0이거나, 배열의 끝이라면 그냥 1을 넣고 끝낸다.
// 5. 그게 아니라면, answer[i-1][j-1] + answer[i-1][j]의 값을 넣어준다.
