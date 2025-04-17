class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else { return false }

        var counts: [Character: Int] = [:]

        for char in s {
            counts[char, default: 0] += 1
        }

        for char in t {
            counts[char, default: 0] -= 1
        }

        return counts.values.allSatisfy { $0 == 0 }
    }
}