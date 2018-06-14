import XCTest
import Nimble
@testable import Tracking

class DictionaryExtensionTests: XCTestCase {
    func test_keyIsNil_nothingIsAdded() {
        var dict = ["A": "B"]
        dict[optional: nil] = "C"
        expect(dict).to(equal(["A": "B"]))
    }

    func testConcationation_twoDistinctDicts_allValuesInResult() {
        expect(["k1": "v1"] + ["k2": "v2"]).to(equal(["k1": "v1", "k2": "v2"]))
    }

    func testConcationation_twoNonDistinctDicts_valuesOfLastDictKept() {
        expect(["k1": "v1"] + ["k1": "v2"]).to(equal(["k1": "v2"]))
    }

    func testInlineConcationation_twoDistinctDicts_lastIsKept() {
        var dict1: [String: String]? = ["k1": "v1"]
        let dict2: [String: String]? = ["k2": "v2"]
        dict1 += dict2
        expect(dict1).to(equal(["k1": "v1", "k2": "v2"]))
    }

    func testInlineConcationation_twoNonDistinctDicts_lastIsKept() {
        var dict1: [String: String]? = ["k1": "v1"]
        let dict2: [String: String]? = ["k1": "v2"]
        dict1 += dict2
        expect(dict1).to(equal(["k1": "v2"]))
    }

    func testMap_stringArray_keyAndValueMapped() {
        expect(["1": "2", "2": "3"].map(transform: {(Int($0)!, Int($1)!*100)})).to(equal([1: 200, 2: 300]))
    }
}
