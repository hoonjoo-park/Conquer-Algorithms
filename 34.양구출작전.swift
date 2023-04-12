import Foundation

func 양구출작전 () {
    let n = Int(readLine()!)!
    var islands = Array(repeating: [Int](), count: n+1)
    var animals = Array(repeating: 0, count: n + 1)
    var destinations = Array(repeating: 0, count: n + 1)
    
    for i in 2...n {
        let input = readLine()!.split(separator: " ")
        let animal = String(input[0])
        
        guard let count = Int(input[1]), let destination = Int(input[2]) else { continue }
        
        // 양이면 더해줘야되고, 늑대면 빼줘야되기 때문에 아래와 같이 저장한다.
        animals[i] = animal == "S" ? count : -count
        // 도착지에 현재 섬의 index를 넣어준다. (islands에는 자신을 거쳐가는 섬들의 index가 배열로 담기게 된다)
        islands[destination].append(i)
        // 각 섬들의 다음 섬 위치를 저장해준다.
        destinations[i] = destination
    }
    
    var queue = [Int]()
    var stack = [Int]()
    
    queue.append(1)
    
    while !queue.isEmpty {
        let currentNode = queue.removeFirst()
        stack.append(currentNode)
        
        // currentNode를 거쳐야 하는 섬들의 index를 queue에 담아준다.
        for nextNode in islands[currentNode] {
            queue.append(nextNode)
        }
    }
    
    while !stack.isEmpty {
        let currentNode = stack.popLast()!
        animals[destinations[currentNode]] += max(0, animals[currentNode])
    }
    
    print(animals[0])
}
