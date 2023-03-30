func climbStairs(_ n: Int) -> Int {
    var dp = [0, 1, 2, 3]
    
    if n < 4 { return n }
    
    for i in 4...n {
        let sum = dp[i-2] + dp[i-1]
        print(dp, sum)
        dp.append(sum)
    }
    
    return dp.last!
}
