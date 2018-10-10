import UIKit


var array = [0, 1, 2, 3, 4, 5, -6, 7, 8, 9]
/// check variable on array
// Best:
array.contains(4)

// Bad:
array.filter({$0 == 4}).isEmpty == false
array.first(where: {$0 == 1}) != nil

var string = ""

/// check empty variable
//Best:
string.isEmpty

//Bad:
string.count == 0


/// Get first object matching a condition
// Best:
let array1 = array.first(where: {$0 < 0})

// Bad:
let array2 = array.filter({$0 < 0}).first


// Get maximun value or minium value

var arrs = [0, 4, 6, 1]

// Best:
arrs.max()
arrs.min()

// Bad:
arrs.sorted().first
arrs.sorted().last

/// Making sure all object match a condition

// Best:
arrs.allSatisfy({$0 % 2 == 0})

// Bad:
arrs.filter({$0 % 2 == 0}).isEmpty
