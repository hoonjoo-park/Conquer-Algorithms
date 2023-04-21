import Foundation

func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
    var answer = [[Int]]()
    let maxCount = candidates.count
    let sorted = candidates.sorted()
    
    func backtracking(_ index: Int, _ sum: Int, _ permutation: [Int]) {
        if sum == target {
            answer.append(permutation)
            return
        }
        
        guard index < maxCount, sum < target else { return }
        
        for i in index..<maxCount {
            let current = sorted[i]
            var permutation = permutation
            
            if (i > index && sorted[i-1] == current) || current > target { continue }
            
            permutation.append(sorted[i])
            backtracking(i+1, sum + sorted[i], permutation)
        }
    }
    
    backtracking(0, 0, [])
    
    return answer
}


// candidates: [1, 1, 2, 5, 6, 7, 10], target: 8

// backtracking(0, 0, []) 실행
// permutation=[1] -> rest=[1, 2, 5, 6, 7, 10], index=0

// backtracking(1, 1, [1]) 실행
// premutation=[1, 1] -> [2, 5, 6, 7, 10], index=1
// ❓여기서 1이 들어갈 수 있는 이유: i > index && sorted[i-1] == current) 조건 때문!
// index는 1이고, 그에 따라 i도 1부터 시작하는데, 첫 시작때는 i와 index가 같기 때문에 1이 또 다시 들어갈 수 있는 것이다.
