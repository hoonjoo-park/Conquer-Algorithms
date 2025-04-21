class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        let lastIndex = digits.count - 1
        var result = digits

        for i in stride(from: lastIndex, through: 0, by: -1) {
            if result[i] < 9 {
                result[i] += 1
                return result
            }

            result[i] = 0
        }

        var extendedResult = Array(repeating: 0, count: digits.count + 1)

        // ex) 999 -> 1000
        extendedResult[0] = 1
        for i in 0...lastIndex {
            extendedResult[i+1] = result[i]
        }

        return extendedResult
    }
}