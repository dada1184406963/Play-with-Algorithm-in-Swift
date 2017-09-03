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
    
    print("The sort has spent \(endTime - startTime).")
}
