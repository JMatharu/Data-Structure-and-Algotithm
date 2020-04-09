/*
 Two-dimensional Version
 */

/*
 Greedy Ascent Algorithm
 Θ(nm) complexity, Θ(n2(square)) algorithm if m = n
 (Palle nai pya, na jada damag lagaya :P)
 */

/*
 "2D recursive" algorithm
 If T(n, m) denotes work required to solve problem with n rows and m columns = Θ(n log n)
 */

//func find2DPeak<T: Comparable>(nums: [[T]]) {
//
//    let rows = nums.count
//    let midColumn =
//
//}
//
//let problemMatrix = [
//    [ 4,  5,  6,  7,  8,  7,  6,  5,  4,  3,  2],
//    [ 5,  6,  7,  8,  9,  8,  7,  6,  5,  4,  3],
//    [ 6,  7,  8,  9, 10,  9,  8,  7,  6,  5,  4],
//    [ 7,  8,  9, 10, 11, 10,  9,  8,  7,  6,  5],
//    [ 8,  9, 10, 11, 12, 11, 10,  9,  8,  7,  6],
//    [ 7,  8,  9, 10, 11, 10,  9,  8,  7,  6,  5],
//    [ 6,  7,  8,  9, 10,  9,  8,  7,  6,  5,  4],
//    [ 5,  6,  7,  8,  9,  8,  7,  6,  5,  4,  3],
//    [ 4,  5,  6,  7,  8,  7,  6,  5,  4,  3,  2],
//    [ 3,  4,  5,  6,  7,  6,  5,  4,  3,  2,  1],
//    [ 2,  3,  4,  5,  6,  5,  4,  3,  2,  1,  0]
//]
//
//find2DPeak(nums: problemMatrix)



func bubbleSort_iterative<T: Comparable>(on array: inout [T]) -> [T?] {
    
    if array.count == 1 {
        return array
    }

    let arrayLength = array.count
    
    for i in 0..<arrayLength {
        var flag = false
        for j in 0..<arrayLength - i - 1 {
            if array[j] < array[j + 1] {
                let temp = array[j]
                array[j] = array[j + 1]
                array[j + 1] = temp
                flag = true
            }
        }
        if !flag { break }
    }
    
    return array
}

var array = [10,9,7,5,6, 8]
var array2 = [5]
var array3 = [6,4,3,2,1]
var array4 = [9,8,7,6,5,4,3,2,1,12,3,4,54,6,356,45,67,56,78568,756,34,56,2452]
bubbleSort_iterative(on: &array) //[10, 9, 8, 7, 6, 5]
bubbleSort_iterative(on: &array2) //[5]
bubbleSort_iterative(on: &array3) //[6, 4, 3, 2, 1]
bubbleSort_iterative(on: &array4) //[78568, 2452, 756, 356, 67, 56, 56, 54, 45, 34, 12, 9, 8, 7, 6, 6, 5, 4, 4, 3, 3, 2, 1]



func bubbleSort_recursion<T: Comparable>(on array: inout[T]) -> [T] {
    
    if array.count == 1 {
        return array
    }
    
    for i in 0..<array.count - 1 {
        if array[i] < array[i + 1] {
            let temp = array[i]
            array[i] = array[i + 1]
            array[i + 1] = temp
        }
    }
    
    bubbleSort_iterative(on: &array)
    
    return array
}

bubbleSort_recursion(on: &array) //[10, 9, 8, 7, 6, 5]
bubbleSort_recursion(on: &array2) //[5]
bubbleSort_recursion(on: &array3) //[6, 4, 3, 2, 1]
bubbleSort_recursion(on: &array4) //[78568, 2452, 756, 356, 67, 56, 56, 54, 45, 34, 12, 9, 8, 7, 6, 6, 5, 4, 4, 3, 3, 2, 1]
