class Solution {
    func mergeAlternately(_ word1: String, _ word2: String) -> String {
        var answer = ""
        var i = 0
        var j = 0

        while i < word1.count || j < word2.count {
            if i < word1.count {
                answer.append(word1[word1.index(word1.startIndex, offsetBy: i)])
                i+=1
            }

            if j < word2.count {
                answer.append(word2[word2.index(word2.startIndex, offsetBy: j)])
                j+=1
            }
        }

        return answer
    }
}

// 조금 더 Swift스러운 풀이
class Solution2 {
    func mergeAlternately(_ word1: String, _ word2: String) -> String {
        var answer = ""
        
        // zip 함수를 사용해서 두 문자열을 튜플 형태로 묶어서 반복 (더 짧은 문자열의 길이만큼 반복한다)
        for (ch1, ch2) in zip(word1, word2) {
            // zip에 의해 반환된 각 문자열을 Character 타입으로 문자열에 추가
            answer += [ch1, ch2]
        }
        
        // 두 문자열의 길이가 다르면 남은 문자열을 뒤에 이어붙여줌
        if word1.count < word2.count {
            answer += word2[word1.endIndex...]
        } else {
            answer += word1[word2.endIndex...]
        }
        
        return answer
    }
}