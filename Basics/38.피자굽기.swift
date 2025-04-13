import Foundation

func 피자굽기() {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (d, n) = (input[0], input[1])
    var oven = readLine()!.split(separator: " ").map { Int(String($0))! }
    let pizzas = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    for i in 0..<d-1 {
        if oven[i] < oven[i+1] {
            oven[i+1] = oven[i]
        }
    }
    
    var lo = 0
    var hi = d
    
    for pizza in pizzas {
        findIndex(pizza)
        // hi 위에 피자가 쌓이는 것이기 때문에 findIndex 후에 hi에서 1을 빼줘야 함
        hi -= 1
        // hi가 0보다 작으면 피자가 다 들어갈 수 없는 것
        if hi < 0 { break }
        lo = 0
    }
    
    func findIndex(_ target: Int) {
        while lo < hi {
            let mid = (lo + hi) / 2
            // 만약 현재 넣으려는 피자(target)가 이분탐색 중인 오븐의 넓이보다 크면? -> 애초에 다음 피자들은 그 이후로 지나갈 수 없음
            // 따라서 hi의 범위를 아예 mid로 줄여버림
            if target > oven[mid] {
                hi = mid
            } else {
                lo = mid + 1
            }
        }
    }
    
    
    print(hi + 1)
}

// 풀이 로직
// 1. 오븐은 자신의 위쪽 오븐 크기에 영향을 받는다. (자신보다 작은 오븐이 위에 있으면 어차피 그것보다 큰 피자가 들어올 수 없음)
// 2. 그리고 또 중요한 점은, 이 이분탐색은 내림차순에 대한 이분탐색을 해야된다는 것이다.

// * 예시 *
// 7 3
// 5 6 4 3 6 2 3
// 3 2 5

// * 5543322가 되는 과정 *
// 맨 앞에 있는 5 때문에 어차피 다음 6이 받을 수 있는 피자의 크기는 최대 5가 된다.
// 그리고 그 다음 4는 자신의 크기만큼 피자를 받을 수 있다.
// 그 다음 3도 똑같다.
// 하지만, 그 다음에 오는 6이 받을수 있는 최대 크기의 피자는 자신의 위 오븐인 3 때문에 3이 되어버린다.
// ... 이 로직 반복
