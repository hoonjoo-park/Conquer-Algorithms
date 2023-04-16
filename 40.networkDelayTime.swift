import Foundation

class Solution {
    func networkDelayTime(_ times: [[Int]], _ n: Int, _ k: Int) -> Int {
        var list = Array(repeating: [(Int, Int)](), count: n + 1)
        var distances = Array(repeating: Int.max, count: n + 1)

        for time in times {
            let (u, v, w) = (time[0], time[1], time[2])
            
            list[u].append((v, w))
        }

        var queue: [(node: Int, dist: Int)] = []
        distances[k] = 0

        queue.append((node: k, dist: 0))

        while !queue.isEmpty {
            let current = queue.removeFirst()
            let (currentNode, currentDistance) = (current.0, current.1)

            for (nextNode, nextDistance) in list[currentNode] {
                // 현재까지의 거리 + 다음 거리가 이전 경로보다 더 크다면 굳이 갱신해줄 필요가 없으므로 continue
                if currentDistance + nextDistance >= distances[nextNode] { continue }
                
                distances[nextNode] = currentDistance + nextDistance
                queue.append((node: nextNode, dist: currentDistance + nextDistance))
            }
        }
        
        // distances에서 Int.max를 제외한 것들 중 가장 큰 값을 추출한다. (만약 전체가 Int.max면 -1이 반환된다)
        let validDistances = distances.filter { $0 != Int.max }
        let maxDist = validDistances.max() ?? -1

        return validDistances.count == n ? maxDist : -1
    }
}
