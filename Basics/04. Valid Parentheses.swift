import Foundation

func isValid(_ s: String) -> Bool {
    if s.count % 2 != 0 { return false }
    
    var stack: [Character] = []
    
    for char in s {
        switch char {
        case "(": stack.append(")")
        case "[": stack.append("]")
        case "{": stack.append("}")
        default:
            if stack.isEmpty || stack.removeLast() != char { return false }
        }
    }
    return stack.isEmpty
}
