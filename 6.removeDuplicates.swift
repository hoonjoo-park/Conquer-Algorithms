// MARK: 첫 번째 풀이
func removeDuplicates(_ nums: inout [Int]) -> Int {
    // 우선, 각 숫자가 몇 번 나왔는지 체크하기 위한 딕셔너리를 만들어준다.
    var numCounts: [Int:Int] = [:]
    // index는 배열 내에서 변경되어야 할 숫자의 index를 의미한다.
    // ex) [1,1,2]가 input으로 들어왔을 때, 두 번쨰 1은 2로 변경되어야 하기 때문에, index를 계속 기억해야 한다.
    var index = 0
    
    for num in nums {
        // numCounts[num]야 nil이면 처음 만나는 숫자라는 의미다.
        if numCounts[num] == nil {
            // 따라서 해당 숫자의 방문표시(1)를 해주고, nums[index]를 현재 num으로 변경해준다.
            numCounts[num] = 1
            nums[index] = num
            // 그리고 index에 1을 더해준다.
            index += 1
        } else {
            nums[index] = 999
        }
    }
    
    return index
}


// MARK: 두 번째 풀이

func removeDuplicates2(_ nums: inout [Int]) -> Int {
    guard nums.count > 1 else { return nums.count }
    
    var index = 0
    
    for n in nums where n != nums[index] {
        index += 1
        nums[index] = n
    }
    
    return index + 1
}
