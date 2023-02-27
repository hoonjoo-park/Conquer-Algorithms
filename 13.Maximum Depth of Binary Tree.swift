func maxDepth(_ root: TreeNode?) -> Int {
    guard root != nil else { return 0 }
    
    return 1 + max(maxDepth(root?.left), maxDepth(root?.right))
}

// 풀이 로직
// 1. stack에 순회할 node들을 담는다.
// 2. while문 내에서 계속 stack에 있는 node들을 탐색한다.
// 3. var count의 개수를 max를 통해 계속 업데이트 한다.
// 4. 최종적으로 count를 반환한다.
