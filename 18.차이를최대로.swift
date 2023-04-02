import Foundation

func 차이를최대로() {
    let n = Int(readLine()!)!
    let nums = readLine()!.split(separator: " ").map { Int(String($0))! }
    var maxSum = 0

    func calcNums(_ arr: [Int]) -> Int {
        var sum = 0
        
        for i in 0..<n-1 {
            sum += abs(arr[i] - arr[i+1])
        }
        
        return sum
    }

    func dfs(_ permutation: [Int], _ numsToTraverse: [Int]) -> Void {
        
        if permutation.count == nums.count {
            maxSum = max(maxSum, calcNums(permutation))
        }
        
        for (i, num) in numsToTraverse.enumerated() {
            var permutation = permutation
            var numsToTraverse = numsToTraverse
            
            permutation.append(num)
            numsToTraverse.remove(at: i)
            
            dfs(permutation, numsToTraverse)
        }
    }

    dfs([], nums)

    print(maxSum)    
}
