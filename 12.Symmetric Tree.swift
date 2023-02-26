func isSymmetric(_ root: TreeNode?) -> Bool {
    // 재귀함수 활용
    isSymmetricHelper(root, root)
}

private func isSymmetricHelper(_ leftNode: TreeNode?, _ rightNode: TreeNode?) -> Bool {
    // 만약 둘 다 nil이면 결국 같은 것이기 때문에 true 반환
    if leftNode == nil, rightNode == nil { return true }
    // 넘어온 leftNode.val과 rightNode.val이 같지 않으면 대칭이 아니다
    guard leftNode?.val == rightNode?.val else { return false }
    
    // 재귀함수 실행 -> 왼쪽 Node의 왼쪽과 오른쪽 Node의 오른쪽을 비교 && 왼쪽 Node의 오른쪽과 오른쪽 Node의 left를 비교
    let leftResult = isSymmetricHelper(leftNode?.left, rightNode?.right)
    let rightResult = isSymmetricHelper(leftNode?.right, rightNode?.left)
    
    return leftResult && rightResult
}

