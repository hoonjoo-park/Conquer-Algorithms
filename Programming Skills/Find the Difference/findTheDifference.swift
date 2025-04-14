class Solution {
    func findTheDifference(_ s: String, _ t: String) -> Character {
        var counts: [Character: Int] = [:]

        for char in s {
            counts[char, default: 0] += 1
        }

        for char in t {
            counts[char, default: 0] -= 1

            if let count = counts[char], count < 0 { return char }
        }

        return Character("")
    }
}