/*
Bubble Sort - https://www.youtube.com/watch?v=o4bAoo_gFBU&list=PLdo5W4Nhv31bEiyP4tclZMc5mP_X7OD7k&index=1
*/

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
    return bubbleSort_recursion(on: &array, arrayLength: array.count - 1)
}

func bubbleSort_recursion<T: Comparable>(on array: inout[T], arrayLength: Int) -> [T] {
    
    if arrayLength <= 1 {
        return array
    }
    
    for i in 0..<arrayLength - 1 {
        if array[i] < array[i + 1] {
            let temp = array[i]
            array[i] = array[i + 1]
            array[i + 1] = temp
        }
    }
    
    return bubbleSort_recursion(on: &array, arrayLength: arrayLength - 1)
}

bubbleSort_recursion(on: &array) //[10, 9, 8, 7, 6, 5]
bubbleSort_recursion(on: &array2) //[5]
bubbleSort_recursion(on: &array3) //[6, 4, 3, 2, 1]
bubbleSort_recursion(on: &array4) //[78568, 2452, 756, 356, 67, 56, 56, 54, 45, 34, 12, 9, 8, 7, 6, 6, 5, 4, 4, 3, 3, 2, 1]
