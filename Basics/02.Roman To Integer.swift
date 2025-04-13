private let dict: [Character:Int] = ["I":1,"V":5,"X":10,"L":50,"C":100,"D":500,"M":1000]

func romanToInt(_ s: String) -> Int {
    var answer = 0
    var prevValue = 0
    
    for i in s {
        let currentValue = dict[i] ?? 0
        // 로마 숫자에서는 조합 숫자가 아닌 이상, 왼쪽 숫자가 오른쪽 숫자보다 크거나 같다.(왼쪽 숫자가 오른쪽 숫자보다 작다면 이는 조합 숫자인 것이다.)
        let isCombination = prevValue < currentValue
        // 만약 조합숫자면 이전 숫자를 빼줘야 한다. (조합 숫자는 "우측 숫자 - 좌측 숫자"를 의미하기 때문)
        answer += isCombination ? -prevValue : prevValue
        prevValue = currentValue
    }
    
    answer += prevValue
    return answer
}
