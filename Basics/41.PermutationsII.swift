import Foundation

// 내가 푼 풀이
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


// 다른 풀이: 해시맵(딕셔너리)을 사용해 시간 복잡도 대폭 향상
func permuteUnique2(_ nums: [Int]) -> [[Int]] {
    var answer = [[Int]]()
    var permutation = [Int]()
    var countDict = [Int: Int]()
    
    for num in nums {
        countDict[num, default: 0] += 1
    }
    
    func dfs() {
        if permutation.count == nums.count {
            answer.append(permutation)
            return
        }
        
        for (num, count) in countDict {
            if count == 0 { continue }
            
            permutation.append(num)
            countDict[num, default: 0] -= 1
            dfs()
            permutation.removeLast()
            countDict[num, default: 0] += 1
        }
    }
    
    dfs()
    
    return answer
}
