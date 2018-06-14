func +=<T: Hashable, U>( lhs: inout [T: U]?, rhs: [T: U]?) {
    let res = lhs + rhs
    lhs = res
}

func +<T: Hashable, U>(lhs: [T: U]?, rhs: [T: U]?) -> [T: U]? {
    guard lhs != nil || rhs != nil else { return nil }
    guard let lhs = lhs else { return rhs }
    guard let rhs = rhs else { return lhs }

    return lhs.merging(rhs, uniquingKeysWith: { $1 })
}


extension Dictionary {

    public func map<T: Hashable, U>(transform: (Key, Value) -> (T, U)) -> [T: U] {
        var result: [T: U] = [:]
        for (key, value) in self {
            let (transformedKey, transformedValue) = transform(key, value)
            result[transformedKey] = transformedValue
        }
        return result
    }

    subscript(optional optionalKey: Key?) -> Value? {
        get {
            guard let key = optionalKey else { return nil }
            return self[key]
        }
        set {
            guard let key = optionalKey else { return }
            self[key] = newValue
        }

    }

}

