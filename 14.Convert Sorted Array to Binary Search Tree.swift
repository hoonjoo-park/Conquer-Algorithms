func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
    BSTGenerator(nums, 0, nums.count - 1)
}

private func BSTGenerator(_ nums: [Int], _ left: Int, _ right: Int) -> TreeNode? {
    guard left <= right else { return nil }
    
    // 둘 다 정수(Int)이기 때문에, 나눗셈 결과의 소숫점은 버려진다.
    let mid = (left + right) / 2
    let root = TreeNode(nums[mid])
    
    root.left = BSTGenerator(nums, left, mid-1)
    root.right = BSTGenerator(nums, mid + 1, right)
    
    return root
}

// TestCase: [-10,-3,0,5,9]
