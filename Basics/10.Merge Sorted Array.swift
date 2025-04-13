func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    // removeLast method를 활용하여 원본 배열의 끝부터 m까지를 잘라내준다.
    nums1.removeLast(nums1.count - m)
    // 그리고 nums2를 n만큼 잘라 slicedNums2에 할당해준다
    // 문제 제한 사항에 따라, nums2 자체는 원본 배열에 변화가 없어도 되기 때문에 removeLast를 사용하지 않았다
    let slicedNums2 = nums2.prefix(n)
    
    // 그리고 잘린 nums1 + 잘린 nums2를 합쳐준다. (nums1의 원본 배열은 계속 변화하고 있는 것!)
    nums1 += slicedNums2
    // 최종적으로 오름차순 정렬을 해준다.
    nums1.sort()
}
