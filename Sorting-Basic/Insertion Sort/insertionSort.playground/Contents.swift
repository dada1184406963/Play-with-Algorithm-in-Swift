//: Playground - noun: a place where people can play


func insertionSort(array: inout Array<Int>) {
    
    assert(array.count >= 1)
    for i in 1..<array.count {
        for j in stride(from: i, to: 0, by: -1) {
            if array[j] < array[j - 1] {
                swap(&array[j], &array[j - 1])
            }
            else {
                break   //在此处作的控制转移非常重要，能大幅改善程序性能
            }
        }
    }
    
}


 func insertionSortAdvanced(array: inout Array<Int>) {
 
    assert(array.count >= 1)
 
    var cur = 0
    for i in 1..<array.count {
        
        let temp = array[i]
        for j in stride(from: i, to: 0, by: -1) {
            cur = j
            if array[j - 1] > temp {
                array[j] = array [j - 1]
                cur = j - 1
            }
            else {
                break   //在此处作的控制转移非常重要，能大幅改善程序性能
            }
        }
        array[cur] = temp
    }

}
 


func insertionSortAdvanced2(array: inout Array<Int>) {
    
    assert(array.count >= 1)
    
    for i in 1..<array.count {
        
        let temp = array[i]
        var j = i
        while j > 0 && array[j - 1] > temp {
            array[j] = array[j - 1]
            j -= 1
        }
        array[j] = temp
    }
    
}

func selectionSort(array: inout Array<Int>) {
    
    for i in 0..<array.count - 1 {
        var indexOfMin = i
        for j in i + 1..<array.count {
            if array[j] < array[indexOfMin] {
                indexOfMin = j
            }
        }
        if (indexOfMin != i) {  //这里必须做一次检查，否则会提示致命错误
            swap(&array[i], &array[indexOfMin])
        }
    }
}


var array1 = generateRand(n: 10 , rangeL: 0, rangeR: 100)
var array2 = array1
//array2.sort()
var array3 = array1
var array4 = array1
//我不懂为什么下面的函数insertionSort的参数为什么要写成这样
testSortTime(array: &array1, sort: insertionSort(array:))
testSortTime(array: &array2, sort: insertionSortAdvanced(array:))
testSortTime(array: &array4, sort: insertionSortAdvanced(array:))
testSortTime(array: &array3,sort: selectionSort(array:))


//进行近似有序数组排序测试
print("------")

var array5 = generateNearlyOrderedArray(count: 200, swapTimes: 10)
var array6 = array5
var array7 = array5
var array8 = array5
testSortTime(array: &array5, sort: insertionSort(array:))
testSortTime(array: &array6, sort: insertionSortAdvanced(array:))
testSortTime(array: &array7, sort: insertionSortAdvanced(array:))
testSortTime(array: &array8,sort: selectionSort(array:))