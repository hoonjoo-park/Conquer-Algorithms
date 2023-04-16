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
        queue.append((node: k, dist: 0))
        // 시작점에서 시작점으로 가는 거리는 0이기 때문에 아래와 같이 초기화해준다.
        distances[k] = 0

        while !queue.isEmpty {
            let current = queue.removeFirst()
            let (currentNode, currentDistance) = (current.0, current.1)

            for (nextNode, nextDistance) in list[currentNode] {
                // 현재까지의 거리 + 다음 거리가 이전 경로보다 더 크다면 굳이 갱신해줄 필요가 없으므로 continue
                if currentDistance + nextDistance >= distances[nextNode] { continue }
                
                distances[nextNode] = currentDistance + nextDistance
                // queue에 다음 노드와 누적된 거리를 튜플로 담아준다. -> 그러면 이제 다음 노드의 종착지들에 대한 거리를 계산할 때 현재까지의 거리와 합산해서 거리를 계산해줄 수 있다.
                queue.append((node: nextNode, dist: currentDistance + nextDistance))
            }
        }
        
        // distances에서 Int.max를 제외한 것들 중 가장 큰 값을 추출한다. (만약 전체가 Int.max면 -1이 반환된다)
        let validDistances = distances.filter { $0 != Int.max }
        // max()는 배열이 비어있을 때 nil을 반환하기 때문에 예외처리를 아래와 같이 해줘야된다.
        let maxDist = validDistances.max()
        
        return validDistances.count == n ? maxDist : -1
    }
}
