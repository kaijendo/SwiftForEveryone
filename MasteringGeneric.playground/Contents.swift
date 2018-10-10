import UIKit

enum Size {
    case small, medium, large
}

enum Color {
    case red, green, blue
}

struct Product {
    var name: String
    var size: Size
    var color: Color
}

extension Product: CustomStringConvertible {
    var description: String {
        return "\(size) \(color) \(name)"
    }
}


let tree = Product(name: "tree", size: .large, color: .green)
let frog = Product(name: "frog", size: .small, color: .green)
let strawberry = Product(name: "strawberry", size: .small, color: .red)


print([tree, frog, strawberry].filter({$0.size == Size.small}))

protocol Specification {
    associatedtype T
    func isStatisfield(item: T) -> Bool
}

struct ColorSpecification: Specification {
    typealias T = Product
    var color: Color
    func isStatisfield(item: Product) -> Bool {
        return item.color == color
    }
}

struct SizeSpecification: Specification {
    typealias T = Product
    var size: Size
    func isStatisfield(item: Product) -> Bool {
        return item.size == size
    }
}

protocol Filter {
    associatedtype T
    func filter<Spec: Specification>(items: [T], spec: Spec) -> [T] where Spec.T == T
}

struct ProductFilter: Filter {
    typealias T = Product
    
    func filter<Spec>(items: [Product], spec: Spec) -> [Product] where Spec : Specification, ProductFilter.T == Spec.T {
        var output = [T]()
        for item in items {
            if spec.isStatisfield(item: item) {
                output.append(item)
            }
        }
        return output
    }
}

let result = ProductFilter().filter(items: [tree, frog, strawberry], spec: SizeSpecification(size: .small))
