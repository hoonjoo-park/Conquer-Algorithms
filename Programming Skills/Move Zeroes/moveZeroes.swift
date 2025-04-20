class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        var i = 0
        var nonZeroCount = 0

        while i < nums.count {
            if nums[i] != 0 {
                nums[nonZeroCount] = nums[i]
                nonZeroCount += 1
            }

            i += 1
        }

        while nonZeroCount < nums.count {
            nums[nonZeroCount] = 0
            nonZeroCount += 1
        }
    }
}
