class Solution {
    func arraySign(_ nums: [Int]) -> Int {
        var negativeCount = 0

        for num in nums {
            guard num != 0 else { return 0 }

            if num < 0 { negativeCount += 1 }
        }

        return negativeCount % 2 == 0 ? 1 : -1
    }
}