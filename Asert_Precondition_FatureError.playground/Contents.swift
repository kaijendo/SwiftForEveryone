import UIKit

// MARK: - Assert

func printAge(_ age: Int) {
    
//    assert(age >= 0, "Age not allow when age early and equal zero.")

    guard age >= 0 else {
        assertionFailure("Age not allow when age early and equal zero.")
        return
    }
     print("Age is: ",age)
}

printAge(-1)
