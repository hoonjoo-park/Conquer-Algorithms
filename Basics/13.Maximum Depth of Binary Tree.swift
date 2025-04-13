func maxDepth(_ root: TreeNode?) -> Int {
    guard root != nil else { return 0 }
    
    return 1 + max(maxDepth(root?.left), maxDepth(root?.right))
}
