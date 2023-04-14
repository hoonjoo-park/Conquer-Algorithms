import Foundation

func 숫자카드() {
    let n = Int(readLine()!)!
    let cards = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted()
    let m = Int(readLine()!)!
    let nums = readLine()!.split(separator: " ").map { Int(String($0))! }
    var answer = [String]()
    
    for num in nums {
        var lo = 0
        var hi = n - 1
        var found = false
        
        while lo <= hi {
            let mid = (hi + lo) / 2
            let current = cards[mid]
            
            if current == num {
                found = true
                break
            }
            
            if current > num {
                hi = mid - 1
            } else {
                lo = mid + 1
            }
        }
    
        answer.append(found ? "1" : "0")
    }
    
    print(answer.joined(separator: " "))
}

// 풀이 로직
// 전형적인 이분탐색 문제다.
// lo, hi, mid 변수를 통해 이분탐색을 진행해주면 된다.

// 1 2 3 4 5 6 7 8 9 10 11 12

// ### target이 1일 때 ###

// lo: 0
// hi: 11
// mid: 5
// current: 6

// lo: 0
// hi: 4
// mid: 2
// current: 3

// lo: 0
// hi: 1
// mid: 0
// current: 1

// ### target이 2일 때 ###

// lo: 0
// hi: 11
// mid: 5
// current: 6

// lo: 0
// hi: 4
// mid: 2
// current: 3

// lo: 0
// hi: 1
// mid: 0
// current: 1

// lo: 1
// hi: 1
// mid: 1
// current: 2 (찾음)
