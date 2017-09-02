
import Cocoa

for y in stride(from: 1.4, through: -1.1, by: -0.06) {
    for x in stride(from: -1.2, through:1.2, by: 0.025) {
        if( pow((x*x+y*y-1.0),3) - x*x*y*y*y <= 0.0 ) {
            print("*", terminator: "")
        }
        else {
            print(" ", terminator: "")
        }
    }
    print("",terminator:"\n")
}
