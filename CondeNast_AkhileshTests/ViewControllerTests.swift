//
//  ViewControllerTests.swift
//  CondeNast_AkhileshTests
//
//  Created by Akhilesh Kumar Singh on 10/02/22.
//

import XCTest
@testable import CondeNast_Akhilesh

extension UIViewController {
    var hasAppeared: Bool {
        return value(forKey: "_hasAppeared") as? Bool ?? false
    }
    
    func waitToAppear() -> XCTestExpectation {
        let exp = XCTestExpectation(description: "wait_for_condition")
        var waiting = true
        func check() {
            guard waiting else {
                return
            }
            if self.hasAppeared {
                exp.fulfill()
                waiting = false
            } else {
                DispatchQueue.main.async(execute: check)
            }
        }
        check()
        return exp
    }
}

class ViewControllerTests: XCTestCase {
    var mockVC: ViewController?
    var mockWindow: UIWindow?
    
    override func setUpWithError() throws {
        mockWindow = UIWindow(frame: UIScreen.main.bounds)
        mockVC = ViewController()
    }

    override func tearDownWithError() throws {
        mockVC = nil
    }
    
    func loadVC() throws {
        guard let window = mockWindow, let vc = mockVC else {
            XCTFail("Window or VC is not available")
            return
        }
        let navVC = UINavigationController(rootViewController: vc)
        window.rootViewController = navVC
        window.makeKeyAndVisible()
        let exp = vc.waitToAppear()
        let res = XCTWaiter.wait(for: [exp], timeout: 30, enforceOrder: true)
        switch res {
        case .completed:
            break
        default:
            XCTFail("Error Occcured")
        }
    }
    
    func testVCLoad() throws {
        try loadVC()
        XCTAssertNotNil(mockVC)
    }
}
