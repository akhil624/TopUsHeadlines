//
//  APIHelperTests.swift
//  CondeNast_AkhileshTests
//
//  Created by Akhilesh Kumar Singh on 10/02/22.
//

import XCTest
@testable import CondeNast_Akhilesh

class APIHelperTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testTopUSHeadline() throws {
        let url = URL.init(fileURLWithPath: "/Users/akhilesh/Desktop/CondeNast_Akhilesh/TopUsHeadlineResponseJs.json")
        XCTAssertNotNil(url)
        let model = MockAPIHelper.getAction(url, TopUsHeadlineResponse.self)
        XCTAssertNotNil(model)
        XCTAssertNotNil(model?.articles)
        XCTAssert(model?.articles?.count ?? 0 > 0)
        XCTAssertNotNil(model?.articles?[0])
        XCTAssertNotNil(model?.articles?[0].url)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

class MockAPIHelper {
    
    class func getAction<D : Decodable>(_ url: URL, _ decodeObj :D.Type) -> D? {
        do {
            let jsonData = try Data(contentsOf: url)
            let topUsHeadlineResponse = try JSONDecoder().decode(decodeObj.self, from: jsonData)
            return topUsHeadlineResponse
        } catch {
            return nil
        }
    }
}
