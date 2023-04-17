func permute(_ nums: [Int]) -> [[Int]] {
    var answer = [[Int]]()
    
    func dfs(_ permutation: [Int], _ rest: [Int]) {
        for (i, num) in rest.enumerated() {
            var permutation = permutation
            var rest = rest
            
            rest.remove(at: i)
            permutation.append(num)
            
            if rest.isEmpty {
                answer.append(permutation)
                return
            }
            
            dfs(permutation, rest)
        }
    }
    
    dfs([], nums)
    
    return answer
}
