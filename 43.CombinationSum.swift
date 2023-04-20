import Foundation

func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
    var answer = [[Int]]()

    func backtracking(_ index: Int, _ sum: Int, _ permutation: [Int]) {
        if sum > target || index >= candidates.count { return }
        
        if sum == target {
            answer.append(permutation)
            return
        }
        
        for i in index..<candidates.count {
            var permutation = permutation
            
            permutation.append(candidates[i])
            backtracking(i, sum + candidates[i], permutation)
        }
        
    }
    
    backtracking(0, 0, [])
    
    return answer
}

