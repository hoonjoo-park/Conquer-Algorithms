/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
    // 둘 중 하나가 nil이면 -> nil이 아닌 노드를 반환한다. (문제에서 주어진 시작 input들은 nil이 아니기 때문에 처음부터 이 조건문에 걸리지는 않는다.)
    if list1 == nil || list2 == nil { return list1 ?? list2 }
    
    var answer: ListNode?
    
    // 둘 중에 val이 더 작은 노드를 찾는다.
    if list1!.val <= list2!.val {
        // list1이 더 작거나 같으면 answer에 일단 list1을 넣는다. -> (val: Int, next: ListNode)
        answer = list1
        // 근데 list1의 val은 대소비교가 끝났지만, next의 대소비교는 아직 진행되지 않았기 때문에 list1의 next.val과 list2의 val의 비교가 이루어져야 한다. (재귀 시작)
        answer?.next = mergeTwoLists(list1?.next, list2)
    } else {
        answer = list2
        answer?.next = mergeTwoLists(list1, list2?.next)
    }
    
    return answer
}
