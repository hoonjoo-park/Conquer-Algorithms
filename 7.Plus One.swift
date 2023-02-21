func plusOne(_ digits: [Int]) -> [Int] {
    let lastIndex = digits.count - 1
    var carry = 1 // 매번 더해줄 숫자
    var nums = Array(digits) // digits를 깊은 복사
    
    for i in stride(from: lastIndex, through: 0, by: -1) {
        // 현재 num에 carry를 더해준다.
        nums[i] += carry
        // 그리고 carry는 더해진 현재 숫자를 10으로 나눈 몫이다. (즉, 10이 넘으면 1, 20이 넘으면 2가 반환될 것이다)
        carry = nums[i] / 10
        // 그 후, 현재 num을 10으로 나눈 나머지 값으로 변환해준다.
        nums[i] %= 10
    }
    
    // 만약 끝까지 남은 carry가 0보다 크다면 제일 앞에 해당 숫자를 추가해줘야 한다.
    if (carry > 0) { nums.insert(carry, at: 0) }
    
    return nums
}


// ex) [4,3,9,9]

// 1. [4,3,9,10]
    // carry는 1이 된다.
    // nums[i]는 다시 0이 된다.
// 2. [4,3,10,0]
    // carry는 다시 1이 된다.
    // nums[i]는 0이 된다.
// 3. [4,4,0,0]
    // carry는 0이 된다.
    // nums[i]는 4가 된다. (10보다 작기 때문에 자기 자신이 반환되기 떄문)
// 4. [4,4,0,0]이 최종적으로 반환된다.
