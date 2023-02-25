public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

func inorderTraversal(_ root: TreeNode?) -> [Int] {
    var stack: [TreeNode] = []
    var answer: [Int] = []
    var currentNode = root
    
    while currentNode != nil || !stack.isEmpty {
        switch currentNode {
        case .some(let nextNode):
            stack.append(nextNode)
            currentNode = nextNode.left
        default:
            let prev = stack.removeLast()
            answer.append(prev.val)
            currentNode = prev.right
        }
    }
    
    return answer
}

// inorder traversal이란?
// 1. in-order 순회방식은 자신을 기준으로 왼쪽 -> 오른쪽을 순회하는 방식이다.
// 2. 만약 왼쪽과 오른쪽에 어떤 노드도 없으면 자기 자신을 반환한다.
// 3. 일반적으로 Stack의 LIFO 방식을 활용한다.

// 풀이 로직
// 1. 시작점은 root 노드다. 따라서 root노드가 없으면 빈 배열이 정답으로 반환된다.
// 2. 이외에는 currentNode에 root를 할당하고 시작한다.
// 3. currentNode가 계속 while문 안에서 업데이트 된다.
// 4. 만약 currentNode가 nil이 아니라면, stack에 currentNode가 append된다,.
// 5. 그리고 currentNode는 currentNode의 left가 할당된다.
// 6. 하지만 만약, currentNode가 nil이라면 -> stack에서 마지막 요소(prev)를 제거하고 이를 answer 배열에 append 해준다.
// 7. 그리고 currentNode는 prev의 right로 할당된다.
