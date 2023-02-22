func mySqrt(_ x: Int) -> Int {
    if x < 2 { return x }
    
    var left = 1
    var right = x
    
    // 1, 4, 9, 16, 25, 36, 49 ....와 같은 숫자들 사이에서 범위를 점점 좁혀가며 제곱근을 찾는 방식이다.
    while left < right {
        // 일단 left와 right의 중간을 middle에 할당한다.
        let middle = (left + right) / 2
        // 만약 middle의 제곱이 x와 같다면 middle이 정답이다.
        if middle * middle == x { return middle }
        // 하지만, middle의 제곱이 x보다 크다면 right의 범위를 좁혀야 하므로 right=middle이 된다.
        else if middle * middle > x { right = middle  }
        // 반대로 middle의 제곱이 x보다 작다면 left의 범위를 좁혀주면 된다.
        else { left = middle + 1 }
    }
    
    return left - 1
}

// x=8일 때의 예시
// 1, 4, 8 사이에 정답이 있다.
// 4의 제곱은 8보다 크므로 무조건 정답은 4보다 작기 때문에 right의 범위를 4로 좁힌다.
// 그리고 다시 그 절반인 2의 제곱은 8보다 작으므로 1의 범위를 좁혀줘야한다.
// 2와 4의 중간인 3의 제곱은 8보다 작으므로 이번엔 다시 right가 3이 된다.
// 2와 3의 중간(정수)은 2이므로 left와 right의 값이 같아져 반복문이 종료된다.
// 따라서 답은 결국 2.xxxx라는 뜻이므로 문제에서 주어진 바와 같이 그냥 반내림 하여 정수 2를 반환해주면 된다.
