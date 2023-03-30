func longestCommonPrefix(_ strs: [String]) -> String {
    if strs.isEmpty { return "" }
    
    let sortedStrings = strs.sorted { (a,b) -> Bool in
        return a.count < b.count
    }
    var prefix = sortedStrings[0]
    
    for word in sortedStrings {
        while !word.hasPrefix(prefix) {
            prefix = String(prefix.dropLast())
        }
    }
    
    return prefix
}
