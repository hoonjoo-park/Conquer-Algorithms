import Foundation

func permuteUnique(_ nums: [Int]) -> [[Int]] {
    var permutationSet = Set<String>()
    var answer = [[Int]]()
    
    func dfs(_ permutation: [Int], _ rest: [Int]) {
        for (i, num) in rest.enumerated() {
            var permutation = permutation
            var rest = rest
            
            permutation.append(num)
            rest.remove(at: i)
            
            if rest.isEmpty {
                let stringPermutation = permutation.map({ String($0) }).joined(separator: "")
                
                guard !permutationSet.contains(stringPermutation) else { continue }
                
                permutationSet.insert(stringPermutation)
                answer.append(permutation)
                continue
            }
            
            dfs(permutation, rest)
        }
    }
    
    dfs([], nums)
    
    return answer
}

