import Foundation

func 블랙잭() {
    let arr = readLine()!.split(separator: " ").map{ Int($0)! }
    let n = arr[0], m = arr[1]
    let cards = readLine()!.split(separator: " ").map{ Int($0)! }
    
    print(getAnswer(n, m, cards))
    
    func getAnswer(_ n: Int, _ m: Int, _ cards: [Int]) -> Int {
        var answer = 0
        
        for i in 0..<n {
            for j in i+1..<n {
                for k in j+1..<n {
                    let sum = cards[i] + cards[j] + cards[k]
                    let diff = m - sum
                    
                    guard diff >= 0 else { continue }
                    
                    if (diff == 0) { return m }
                    
                    answer = max(answer, sum)
                }
            }
        }
        
        return answer
    }
}

// 로직 (이전 문제들과 가장 큰 차이점은, 합을 구하는 것이기 때문에 순서가 상관 없는 순열 조합을 구하기만 해도 된다는 것이다.)
// 1. 우선, N이 3이라면 그냥 cards의 총합을 반환한다.
// 2. cards에서 세 장의 카드를 뽑은 순서가 상관 없는 permutation을 구한다.
// 3. 그리고 그 카드들 중, M과의 차이가 가장 작은 숫자를 반환하면 된다.
