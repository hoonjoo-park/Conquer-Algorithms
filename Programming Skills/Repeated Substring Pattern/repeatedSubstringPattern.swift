class Solution {
    func repeatedSubstringPattern(_ s: String) -> Bool {
        let mergedStr = s + s
        let newStr = mergedStr.dropFirst().dropLast()
        return newStr.contains(s)
    }
}

class Solution2 {
    func repeatedSubstringPattern(_ s: String) -> Bool {
        let strLen = s.count
        if strLen == 1 { return false }

        for len in 1...strLen / 2 where strLen % len == 0 {
            if s == String(repeating: String(s.prefix(len)), count: strLen / len) {
                return true
            }
        }

        return false
    }
}