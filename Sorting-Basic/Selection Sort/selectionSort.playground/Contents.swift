//: Playground - noun: a place where people can play

import Cocoa


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


var array1 = generateRand(n: 2000, rangeL: 0, rangeR: 10000)

testSortTime(array: &array1,sort: selectionSort(array:))
