//: Playground - noun: a place where people can play





func bubbleSort1<T: Comparable>(array: inout Array<T>) {
    
    for i in 0..<array.count {
        
        for j in 1..<array.count - i {
            
            if array[j - 1] > array[j] {
                swap(&array[j - 1], &array[j])
            }
        }
    }
}

//为什么下面两个经过优化的算法的时间性能更差！！！？？？
func bubbleSort2<T: Comparable>(array: inout Array<T>) {
    
    var swapped = true
    var i = 0
    
    while (swapped) {   //如果未进行交换，则说明排序已经完成
        
        swapped = false
        
        for j in 1..<array.count - i {
            
            if array[j - 1] > array[j] {
                swap(&array[j - 1], &array[j])
                swapped = true  //记录是否进行过交换
            }
        }
        
        i += 1
    }
}

func bubbleSort3<T: Comparable>(array: inout Array<T>) {
    
    var i = 0, flag = array.count, k = 0
    
    while (flag > 0) {
        
        k = flag
        flag = 0
        for j in 1..<k {
            if array[j - 1] > array[j] {
                swap(&array[j - 1], &array[j])
                flag = j
            }
        }
        
        i += 1
    }
    
}

var array1 = generateRand(n: 20, rangeL: 0, rangeR: 1000)
var array2 = array1
var array3 = array1
testSortTime(array: &array1, sort: bubbleSort1(array:))
testSortTime(array: &array2, sort: bubbleSort2(array:))
testSortTime(array: &array3, sort: bubbleSort3(array:))
