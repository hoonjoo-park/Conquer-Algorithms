import Foundation

func 구간합구하기4() {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (n, m) = (input[0], input[1])
    let nums = readLine()!.split(separator: " ").map { Int(String($0))! }
    var sums = Array(repeating: 0, count: n+1)
    var answers = [Int]()
    
    // 누적합 배열 채우기
    for i in 1...n {
        sums[i] = sums[i-1] + nums[i-1]
    }
    
    // 구간합 구하기
    for _ in 0..<m {
        let row = readLine()!.split(separator: " ").map { Int(String($0))! }
        let left = row[0]
        let right = row[1]
        // 겹치는 구간의 합을 제거해 줌
        answers.append(sums[right] - sums[left-1])
    }
    
    answers.forEach { print($0) }
}
