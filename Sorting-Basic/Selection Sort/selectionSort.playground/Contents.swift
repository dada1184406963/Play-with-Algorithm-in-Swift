//: Playground - noun: a place where people can play

import Cocoa


/*func swap(a: inout Int, b: inout Int) {
    print("here")
    let tmp = a;
    a = b;
    b = tmp;
}*/


func generateRand(n: Int, rangeL: Int, rangeR: Int) -> Array<Int> {
    
    assert(rangeR >= rangeL)
    
    var array = Array<Int>(repeating: 0, count: n)
    for i in 0..<n {
        array[i] = Int(arc4random()) % (rangeR - rangeL + 1) + rangeL
    }
    
    return array
}

func testSortTime(array: inout Array<Int>) {
    
    let startTime = clock()
    selectionSort(array: &array)
    let endTime = clock()
    
    print("The sort has spent \(endTime - startTime)")
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


var array1 = generateRand(n: 2000, rangeL: 0, rangeR: 10000)

testSortTime(array: &array1)
