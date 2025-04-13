import Foundation

func 좋은수열() {
    let n = Int(readLine()!)
    var foundAnswer = false
    
    func checkIsGood(_ s: String) -> Bool {
        let sequence = s.map { String($0) }
        let len = sequence.count
        let maxLen = len / 2
        var pointer = len - 1
        
        for i in 1...maxLen {
            let leftSubsequence = sequence[pointer - i..<pointer]
            let rightSubsequence = sequence[pointer..<len]
            
            if leftSubsequence == rightSubsequence { return false }
            
            pointer -= 1
        }
        
        return true
    }
    
    func dfs(_ sequence: String) {
        guard !foundAnswer else { return }
        
        if (sequence.count == n) {
            foundAnswer = true
            print(sequence)
            return
        }
        
        for i in 1..<4 {
            let newSequence = sequence + String(i)
            
            if checkIsGood(newSequence) {
                dfs(newSequence)
            }
        }
    }
    
    dfs("1")
}

// 로직
// N자리의 1~3으로 이루어진 순열을 구해야 한다.
// 하지만, 해당 순열은 나쁜 수열이어서는 안된다 (특정 조합이 이어서 반복되면 안됨)
// 나쁜 수열을 제외한 모든 수열(좋은 수열) 중에 가장 작은 값을 반환한다.


