extension Array where Element : Equatable {
    var tail:[Element] {
        return tail(from: 1)
    }
    
    func tail(from from: Int) -> [Element] {
        return from < self.count ? Array(self[from..<self.count]) : []
    }
    
    func nextPosition(of element: Element, from position: Int) -> Int? {
        return self[position..<self.count].indexOf(element)
    }

    private func diff(to other:[Element]) -> [Element] {

        if self.isEmpty {
            return other
        }
        
        if self.first == other.first {
            return self.tail.diff(to: other.tail)
        }
        
        let f = self.first!
        let np = other.nextPosition(of: f, from: 1)
        
        if let np = np {
            return other[0..<np] + self.diff(to: other.tail(from: np))
        }
        
        return self.tail.diff(to: other)
        
    }
    
    func difference(to other:[Element]) -> ([Element],[Element]) {
        return (other.diff(to: self),self.diff(to: other))
    }
}