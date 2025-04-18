bool repeatedSubstringPattern(char* s) {
  int strLen = strlen(s);
  
  if (strLen == 1) return false;

  for (int len = 1; len <= strLen / 2; len++) {
    if (strLen % len != 0) continue;

    for (int i = len; i < strLen; i++) {
        if (s[i] != s[i % len]) break;
        if (i == strLen - 1) return true;
    }
  }

  return false;
}