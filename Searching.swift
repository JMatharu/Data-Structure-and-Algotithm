import Foundation

/*
 Linear Search
 */
func linearSearch<T: Equatable>(on array: [T], for num: T) -> Int? {
    for (index, item) in array.enumerated() where item == num {
        return index
    }
    return nil
}


linearSearch(on: [5, 2, 4, 7], for: 2)

/*
 Binary Search - https://www.youtube.com/watch?v=V_T5NuccwRA
 */
func binarySearch(on array: [Int], for num: Int) -> Int? {
    
    let sortedArray = array.sorted()
    var leftIndex = 0
    var rightIndex = sortedArray.count
    
    while leftIndex <= rightIndex {
        let midIndex = (leftIndex + rightIndex) / 2
        if num > array[midIndex] {
            print("Greater")
            leftIndex = midIndex + 1
        } else if num < array[midIndex] {
            print("Smaller")
            rightIndex = midIndex - 1
        } else if num == array[midIndex] {
           return midIndex
        }
    }
    
    return nil
}

binarySearch(on: [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67], for: 23)


