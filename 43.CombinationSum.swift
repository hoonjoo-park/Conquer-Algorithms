import Foundation

func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
    var answer = [[Int]]()
    var candidates = candidates.sorted()

    func backtracking(_ index: Int, _ remain: Int, _ permutation: [Int]) {
        if remain < 0 { return }
        
        if remain == 0 { answer.append(permutation) }
        
        for i in index..<candidates.count {
            var permutation = permutation
            
            permutation.append(candidates[i])
            backtracking(i, remain - candidates[i], permutation)
            permutation.removeLast()
        }
        
    }
    
    backtracking(0, target, [])
    
    return answer
}
