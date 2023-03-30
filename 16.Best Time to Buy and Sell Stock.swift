import Foundation

func maxProfit(_ prices: [Int]) -> Int {
    var maxProfit = 0
    var minPrice = Int.max
    
    for price in prices {
        minPrice = min(price, minPrice)
        maxProfit = max(maxProfit, price - minPrice)
    }
    
    return maxProfit
}

// 로직

// 투 포인터를 사용하면 될 것 같다.(전수조사 방식)
// left와 right 포인터 사용을 위한 변수를 세팅한다.
// while문을 돌린다. (left < prices.count - 1이 true일 때까지)
// while문 내에서 right가 prices.count가 되는 순간 left++ -> right = left + 1
// max(0, max(prices[right] - prices[left], answer))를 통해 계속 최대값을 찾아 나간다.
// while문이 종료되면 answer를 return해준다.

// 시간 복잡도를 줄일 수 있는 방법은 없을까?
// 투 포인터를 사용하지 않는 방법을 고려해봐야 될 것 같다.
// O(n)으로 문제를 해결하려면.... 반복문이 배열을 단 한번만 순회하도록 해야한다.

// 결국 필요한 것은 현재까지 지나쳐 온 것들 중의 최소 가격이다.
// 현재까지 지나쳐 온 가격들 중에 가장 낮은 가격을 선택하고, 현재 순회 중인 값과의 차를 구해 maxProfit에 더 큰 값을 할당해주면 된다.
