import Foundation

func 연산자끼워넣기() {
    let n = Int(readLine()!)!
    let nums = readLine()!.split(separator: " ").map { Int(String($0))! }
    let operators = readLine()!.split(separator: " ").map { Int(String($0))! }
    var maxResult = Int.min, minResult = Int.max
    
    func calc(_ permutation: [Int]) {
        var value = nums[0]
        
        for (i, opIndex) in permutation.enumerated() {
            switch opIndex {
            case 0:
                value += nums[i+1]
            case 1:
                value -= nums[i+1]
            case 2:
                value *= nums[i+1]
            default:
                value /= nums[i+1]
            }
        }
        
        maxResult = max(maxResult, value)
        minResult = min(minResult, value)
    }
    
    func dfs(_ permutation: [Int], _ rest: [Int]) {
        if permutation.count == n-1 {
            calc(permutation)
            return
        }
        
        var permutation = permutation
        var rest = rest
        
        for (i, num) in rest.enumerated() {
            guard num > 0 else { continue }
            
            permutation.append(i)
            rest[i] -= 1
            dfs(permutation, rest)
            rest[i] += 1
            permutation.removeLast()
        }
    }
    
    dfs([], operators)
    
    print(maxResult)
    print(minResult)
}


// 풀이 로직
// 1. 입력 받은 operatorCounts를 통해 operator들을 operators 배열에 담아준다.
// 2. 해당 배열을 기반으로 permutation을 만든다. (dfs)
// 3. permutaion으로 연산(calc)을 수행한다. (연산자 우선순위는 무시해도 된다)
// 4. maxResult와 minResult를 업데이트 해준다.
