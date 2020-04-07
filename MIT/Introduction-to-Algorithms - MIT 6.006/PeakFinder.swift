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
        if i + 1 == nums.count {
            return i
        }
        if nums[i] > nums[i+1] {
            return i
        }
    }
    return nil
}

findPeakIndexWithStraighyForward(for: [1,4,3,2,1]) // 1
findPeakIndexWithStraighyForward(for: [0,2,4,6,7]) // 4
findPeakIndexWithStraighyForward(for: [1,2,3,4,3,2,1]) // 3
findPeakIndexWithStraighyForward(for: [8,6,4,3,1]) // 0

/*
 "Divide & Conquer" algorithm (Iterative)
 Binary Search
 Θ(log2(n))
 */

func findPeakIndexWithDivideAndConqure_iterative(for nums: [Int]) -> Int? {
    
    let n = nums.count
    let midIndex = n/2
    let mid = nums[midIndex]
    
    if mid < nums[midIndex - 1] {
        let lowerIndex = 0
        var upperIndex = midIndex
        while upperIndex > lowerIndex {
            if nums[upperIndex] > nums[upperIndex - 1] {
                return upperIndex
            } else if nums[upperIndex] < nums[upperIndex - 1] {
                upperIndex -= 1
            }
        }
        return upperIndex
    } else if mid < nums[midIndex + 1] {
        var lowerIndex = midIndex
        let upperIndex = nums.count - 1
        while upperIndex > lowerIndex {
            if nums[lowerIndex] > nums[lowerIndex + 1] {
                return lowerIndex
            } else if nums[lowerIndex] < nums[lowerIndex + 1] {
                lowerIndex += 1
            }
        }
        return lowerIndex
    } else {
        return n/2
    }
}

findPeakIndexWithDivideAndConqure_iterative(for: [1,2,4,3,2,1]) //2
findPeakIndexWithDivideAndConqure_iterative(for: [0,2,4,6,7]) //4
findPeakIndexWithDivideAndConqure_iterative(for: [0,2,4,6,7,6,5,4]) //4
findPeakIndexWithDivideAndConqure_iterative(for: [1,2,3,4,3,2,1]) // 3
findPeakIndexWithDivideAndConqure_iterative(for: [8,6,4,3,1]) //0

/*
 "Divide & Conquer" (a recursive) algorithm
 Binary Search, finds the peak value
 Θ(log2(n))
 */

func findPeakValueWithDivideAndConqure_recursion<T: Comparable>(for nums: [T]) -> T? {
    
    if nums.count <= 1 {
        return nums.first
    }
    
    let middle: Int = nums.count / 2
    
    // look at the left
    if middle - 1 >= 0 && nums[middle] < nums[middle - 1] {
        return findPeakIndexWithDivideAndConqure_recursion(for: Array(nums[0..<middle]))
    } else if middle + 1 < nums.count && nums[middle] < nums[middle + 1] {
        return findPeakIndexWithDivideAndConqure_recursion(for: Array(nums[middle + 1..<nums.count]))
    } else {
        return nums[middle]
    }
}

print(findPeakValueWithDivideAndConqure_recursion(for: [1,2,4,3,2,1])) // Optional(4)
print(findPeakValueWithDivideAndConqure_recursion(for: [0,2,4,6,7])) // Optional(7)
print(findPeakValueWithDivideAndConqure_recursion(for: [0,2,4,6,7,6,5,4])) // Optional(7)
print(findPeakValueWithDivideAndConqure_recursion(for: [1,2,3,4,3,2,1])) //  Optional(4)
print(findPeakValueWithDivideAndConqure_recursion(for: [8,6,4,3,1])) // Optional(8)
print(findPeakValueWithDivideAndConqure_recursion(for: [1])) // Optional(1)
print(findPeakValueWithDivideAndConqure_recursion(for: Array<Int>())) // nil
/*
 "Divide & Conquer" (a recursive) algorithm
 Binary Search, finds the index value
 Θ(log2(n))
 */

func findPeakIndexWithDivideAndConqure_recursion<T: Comparable>(for nums: [T]) -> Int? {
    findPeakIndexWithDivideAndConqure_recursion(for: nums, 0, nums.count - 1)
}

func findPeakIndexWithDivideAndConqure_recursion<T: Comparable>(for nums: [T], _ lowerBound: Int, _ upperBound: Int) -> Int? {
    if lowerBound > upperBound {
        return nil
    }
    
    if lowerBound == upperBound {
        return lowerBound
    }
    
    let middle: Int = lowerBound + (upperBound - lowerBound) / 2

    if middle - 1 >= lowerBound && nums[middle] < nums[middle - 1] {
        return findPeakIndexWithDivideAndConqure_recursion(for: nums, lowerBound, middle - 1)
    } else if middle + 1 <= upperBound && nums[middle] < nums[middle + 1] {
        return findPeakIndexWithDivideAndConqure_recursion(for: nums, middle + 1, upperBound)
    } else {
        return middle
    }
}

print(findPeakIndexWithDivideAndConqure_recursion(for: [1,2,4,3,2,1])) // Optional(2)
print(findPeakIndexWithDivideAndConqure_recursion(for: [0,2,4,6,7])) // Optional(4)
print(findPeakIndexWithDivideAndConqure_recursion(for: [0,2,4,6,7,6,5,4])) // Optional(4)
print(findPeakIndexWithDivideAndConqure_recursion(for: [1,2,3,4,3,2,1])) //  Optional(3)
print(findPeakIndexWithDivideAndConqure_recursion(for: [8,6,4,3,1])) // Optional(0)
print(findPeakIndexWithDivideAndConqure_recursion(for: [1])) // Optional(0)
print(findPeakIndexWithDivideAndConqure_recursion(for: Array<Int>())) // nil
