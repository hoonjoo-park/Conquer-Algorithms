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
            
            if i > index && sorted[i-1] == current { continue }
            
            permutation.append(sorted[i])
            backtracking(i+1, sum + sorted[i], permutation)
            permutation.removeLast()
        }
    }
    
    backtracking(0, 0, [])
    
    return answer
}
