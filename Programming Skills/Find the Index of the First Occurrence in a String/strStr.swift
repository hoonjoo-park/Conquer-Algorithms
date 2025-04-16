class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        guard haystack.contains(needle) else { return -1 }

        // needle이 hayStack에서 처음 나타나는 범위를 반환
        if let range = haystack.range(of: needle) {
            // hayStack의 시작점 ~ needle의 hayStack 내에서의 시작점까지의 거리를 반환
            return haystack.distance(from: haystack.startIndex, to: range.lowerBound)
        }

        return -1
    }
}