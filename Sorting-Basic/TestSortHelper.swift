import Foundation

public func generateRand(n: Int, rangeL: Int, rangeR: Int) -> Array<Int> {
    
    assert(rangeR >= rangeL)
    
    var array = Array<Int>(repeating: 0, count: n)
    for i in 0..<n {
        array[i] = Int(arc4random()) % (rangeR - rangeL + 1) + rangeL
    }
    
    return array
}

public func testSortTime(array: inout Array<Int>, sort:(inout Array<Int>) -> Void) {
    
    let startTime = clock()
    sort(&array)
    let endTime = clock()
    
    print("The sort has spent \(endTime - startTime)")
}

//生成一个近似有序的数组
public func generateNearlyOrderedArray(count: Int, swapTimes: Int) -> Array<Int> {
    
    var array = Array<Int>(repeating: 0, count: count)
    for i in 0..<count {
        array[i] = i
    }
    
    for _ in 0..<swapTimes {
        
        let posX = Int(arc4random()) % count
        let posY = Int(arc4random()) % count
        
        swap(&array[posX], &array[posY])
    }
    
    return array
}
