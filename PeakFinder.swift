/*
 Peak Finder Problem
 
 One-dimensional Version
 Position 2 is a peak if and only if b ≥ a and b ≥ c. Position 9 is a peak if i ≥ h.
 
 a c b d e f g h i
 1 2 3 4 5 6 7 8 9
 
 a-i are numbers
 
 */

/*
 "Straight forward" algorithm
 θ(n) complexity worst case
 (Linear Search Algorithm)
 */

func findPeakIndexWithStraighyForward(for nums: [Int]) -> Int? {
    for i in 0..<nums.count {
        if (nums[i] == nums.count - 1) {
            return i
        } else if (nums[i] > nums[i+1]) {
            return i
        }
    }
    return nil
}

findPeakIndexWithStraighyForward(for: [4,3,2,1]) // 0
findPeakIndexWithStraighyForward(for: [0,2,4,6,7]) // 2
findPeakIndexWithStraighyForward(for: [1,2,3,4,3,2,1]) // 3
/*
 "Divide & Conquer" (a recursive) algorithm
 */
