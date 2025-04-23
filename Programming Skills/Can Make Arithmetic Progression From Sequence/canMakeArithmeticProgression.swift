class Solution {
    func canMakeArithmeticProgression(_ arr: [Int]) -> Bool {
        let sortedArr = arr.sorted(by: >)
        let diff = sortedArr[0] - sortedArr[1]

        for i in 1..<arr.count - 1 {
            if sortedArr[i] - sortedArr[i+1] != diff { return false }
        }

        return true;
    }
}