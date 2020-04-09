/*
 Insertion Sort - https://www.youtube.com/watch?v=yCxV0kBpA6M&list=PLdo5W4Nhv31bEiyP4tclZMc5mP_X7OD7k&index=2
 */

func insertionSort_iterative<T: Comparable>(on array: inout[T]) -> [T] {

    let arrayLength = array.count
    if arrayLength == 1 { return array }

    for i in 1..<arrayLength {
        var j = i - 1
        let temp = array[i]
        while j >= 0 && array[j] > temp {
            array[j + 1] = array[j]
            j -= 1
        }
        array[j + 1] = temp
    }

    return array
}

var array = [10,9,7,5,6, 8]
var array2 = [5]
var array3 = [6,4,3,2,1]
var array4 = [9,8,7,6,5,4,3,2,1,12,3,4,54,6,356,45,67,56,78568,756,34,56,2452]
insertionSort_iterative(on: &array) //[5, 6, 7, 8, 9, 10]
insertionSort_iterative(on: &array2) //[5]
insertionSort_iterative(on: &array3) //[1, 2, 3, 4, 6]
insertionSort_iterative(on: &array4) //[1, 2, 3, 3, 4, 4, 5, 6, 6, 7, 8, 9, 12, 34, 45, 54, 56, 56, 67, 356, 756, 2452, 78568]

func insertionSort_recursive<T: Comparable>(on array: inout[T]) -> [T] {
    return insertionSort_recursive(on: &array, startIndex: 1)
}

func insertionSort_recursive<T: Comparable>(on array: inout[T], startIndex: Int) -> [T] {

    if startIndex <= 1 { return array }

    var j = startIndex - 1
    let temp = array[startIndex]
    while j >= 0 && array[j] > temp {
        array[j + 1] = array[j]
        j -= 1
    }
    array[j + 1] = temp

    return insertionSort_recursive(on: &array, startIndex: startIndex - 1)
}

insertionSort_recursive(on: &array) //[5, 6, 7, 8, 9, 10]
insertionSort_recursive(on: &array2) //[5]
insertionSort_recursive(on: &array3) //[1, 2, 3, 4, 6]
insertionSort_recursive(on: &array4) //[1, 2, 3, 3, 4, 4, 5, 6, 6, 7, 8, 9, 12, 34, 45, 54, 56, 56, 67, 356, 756, 2452, 78568]
