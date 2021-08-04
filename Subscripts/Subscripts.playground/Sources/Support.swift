import Foundation

// ONLY FOR DEMO PURPOSES!
extension Array {
    public func getValue(at index: Int) -> Element {
        // ... find the element
        return self[index]
    }

    public mutating func setValue(_ value: Element, at index: Int) {
        self[index] = value
    }
}

extension Dictionary {
    public func getValue(for key: Key) -> Value? {
        // ... find the value
        return self[key]
    }

    public mutating func setValue(_ value: Value, for key: Key) {
        self[key] = value
    }
}
