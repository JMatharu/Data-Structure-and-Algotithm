/*
Bubble Sort
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
