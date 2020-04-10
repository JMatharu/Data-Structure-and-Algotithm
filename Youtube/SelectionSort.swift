/*
 Selection Sort - https://www.youtube.com/watch?v=9oWd4VJOwr0&list=PLdo5W4Nhv31bbKJzrsKfMpo_grxuLl8LU&index=99
 */

func selectionSort_iterative<T: Comparable>(on array: inout[T]) -> [T] {
    
    for i in 0..<array.count - 1 {
        var min = i
        for j in i+1..<array.count {
            if array[j] < array[min] {
                min = j
            }
        }
        
        if min != i {
            let temp = array[i]
            array[i] = array[min]
            array[min] = temp
        }
    }
    
    return array
}


var array = [10,9,7,5,6,8]
var array2 = [5]
var array3 = [6,4,3,2,1]
var array4 = [9,8,7,6,5,4,3,2,1,12,3,4,54,6,356,45,67,56,78568,756,34,56,2452]
selectionSort_iterative(on: &array) //[5, 6, 7, 8, 9, 10]
selectionSort_iterative(on: &array2) //[5]
selectionSort_iterative(on: &array3) //[1, 2, 3, 4, 6]
selectionSort_iterative(on: &array4) //[1, 2, 3, 3, 4, 4, 5, 6, 6, 7, 8, 9, 12, 34, 45, 54, 56, 56, 67, 356, 756, 2452, 78568]

func selectionSort_recursive<T: Comparable>(on array: inout[T]) -> [T] {
    return selectionSort_recursive(on: &array, startIndex: 0)
}

func selectionSort_recursive<T: Comparable>(on array: inout[T], startIndex: Int) -> [T] {
    
    if array.count <= 1 { return array }
    if startIndex <= array.count { return array }
    
    let i = startIndex
    var min = i
    
    for j in i+1..<array.count {
        if array[j] < array[min] {
            min = j
        }
    }
    
    if min != i {
        let temp = array[i]
        array[i] = array[min]
        array[min] = temp
    }
    
    return selectionSort_recursive(on: &array, startIndex: i + 1)
}


selectionSort_recursive(on: &array) //[5, 6, 7, 8, 9, 10]
selectionSort_recursive(on: &array2) //[5]
selectionSort_recursive(on: &array3) //[1, 2, 3, 4, 6]
selectionSort_recursive(on: &array4) //[1, 2, 3, 3, 4, 4, 5, 6, 6, 7, 8, 9, 12, 34, 45, 54, 56, 56, 67, 356, 756,
