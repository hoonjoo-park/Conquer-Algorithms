func permute(_ nums: [Int]) -> [[Int]] {
    var answer: [[Int]] = []
    
    func dfs(_ permutation: [Int], _ arrToTraverse: [Int]) -> Void {
        for (i, num) in arrToTraverse.enumerated() {
            var permutation = permutation
            var arrToTraverse = arrToTraverse
            
            permutation.append(num)
            arrToTraverse.remove(at: i)
            
            if permutation.count == nums.count { answer.append(permutation) }
            dfs(permutation, arrToTraverse)
        }
    }
    
    dfs([], nums)
    
    return answer
}
