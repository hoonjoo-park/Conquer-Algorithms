import Foundation

func 줄세우기() {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (n, m) = (input[0], input[1])
    var grid = Array(repeating: [Int](), count: n+1)
    var inDegrees = Array(repeating: 0, count: n+1)
    var answer = [Int]()
    
    for _ in 0..<m {
        let input = readLine()!.split(separator: " ").map { Int(String($0))! }
        let (left, right) = (input[0], input[1])
        
        grid[left].append(right)
        inDegrees[right] += 1
    }
    
    var queue = [Int]()
    
    // 0번째 학생은 없고, 1부터 시작하기 때문에 i도 1을 시작점으로 잡아준다.
    for i in 1...n {
        if inDegrees[i] == 0 {
            queue.append(i)
        }
    }
    
    while !queue.isEmpty {
        let currentNode = queue.removeFirst()
        answer.append(currentNode)
        
        for next in grid[currentNode] {
            inDegrees[next] -= 1
            
            if inDegrees[next] == 0 {
                queue.append(next)
            }
        }
    }
    
    for student in answer {
        print(student, terminator: " ")
    }
}

// 전형적인 위상정렬 문제다
// indegree를 기준으로 bfs를 돌려주면 된다.
// 추상화 해서 생각해 보면 -> indegree가 높다는 것은 자신 보다 키가 큰 학생들이 그만큼 많다는 뜻이다.
