/*
Bubble Sort - https://www.youtube.com/watch?v=o4bAoo_gFBU&list=PLdo5W4Nhv31bEiyP4tclZMc5mP_X7OD7k&index=1
*/

func bubbleSort(on A :[Int]) -> [Int] {
    
    let lengthOfArray = A.count
    var array = A
    print(array)
    for i in 0..<lengthOfArray {
        var flag = false
        for j in 0..<lengthOfArray - 1 - i {
            if array[j] > array[j+1] {
                let temp = array[j]
                array[j] = array[j+1]
                array[j+1] = temp
                flag = true
            }
        }
        if flag == false {
            break
        }
        print(array)
    }
    return array
}

bubbleSort(on: [9,7,5,6, 8])


/*
Insertion Sort - https://www.youtube.com/watch?v=yCxV0kBpA6M&list=PLdo5W4Nhv31bEiyP4tclZMc5mP_X7OD7k&index=2
*/

func insertionSort(on array: [Int]) -> [Int] {
    
    var copyOfArray = array
    
    for i in 1..<copyOfArray.count {
        let temp = copyOfArray[i]
        var j = i - 1
        while (j >= 0 && copyOfArray[j] > temp) {
            copyOfArray[i] = copyOfArray[j]
            j -= 1
        }
        copyOfArray[j + 1] = temp
    }
    return copyOfArray
}

//Time Complexity
// Best case O(n)
// Worst case O(n2)
insertionSort(on: [9,7,5,6, 8])
