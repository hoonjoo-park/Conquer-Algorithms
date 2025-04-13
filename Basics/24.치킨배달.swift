import Foundation

func 치킨배달() {
    typealias Point = (row: Int, col: Int)
    
    let firstLine = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (n, m) = (firstLine[0], firstLine[1])
    
    var answer = Int.max
    var houses = [Point]()
    var chickenPlaces = [Point]()
    var choices = [Point]()
    
    for i in 0..<n {
        let row = readLine()!.split(separator: " ").map { Int(String($0))! }
        
        for j in 0..<n {
            if row[j] == 1 {
                houses.append(Point(row: i, col: j))
            } else if row[j] == 2 {
                chickenPlaces.append(Point(row: i, col: j))
            }
        }
    }
    
    func calcDistance() {
        var totalDistance = 0
        
        for i in 0..<houses.count {
            var minDistance = Int.max
            
            for j in 0..<choices.count {
                let currentChickenPlace = choices[j]
                minDistance = min(minDistance, abs(currentChickenPlace.row - houses[i].row) + abs(currentChickenPlace.col - houses[i].col))
            }
            totalDistance += minDistance
        }
        
        answer = min(answer, totalDistance)
    }
    
    func dfs(_ position: Int) {
        // 치킨집들을 모두 선택했으면 아래의 로직을 수행한다.
        if choices.count == m {
            calcDistance()
            return
        }
        
        for i in position..<chickenPlaces.count {
            choices.append(chickenPlaces[i])
            dfs(i+1)
            choices.removeLast()
        }
    }
    
    dfs(0)
    
    print(answer)
    
}


// 조건
// 1. 폐업시키지 않을 치킨집을 고르고 -> 해당 치킨집들을 기준으로 도시의 최소 치킨 거리를 계산해서 반환한다.
// 2. 남겨야 하는 치킨집의 개수는 M을 넘을 수 없다.

// 로직
// 1. 치킨집 좌표를 1~M개까지 1이 아닌 위치에 넣어준다. (Point 좌표 활용)
// 2. 해당 좌표 조합에 대해, 총 거리들을 계산해준다.
// 3. 그리고 마지막으로 가장 짧은 거리들의 합을 정답으로써 반환해주면 된다.
