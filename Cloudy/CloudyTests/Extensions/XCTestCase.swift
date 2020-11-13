//
//  XCTestCase.swift
//  CloudyTests
//
//  Created by Ygor Nascimento on 06/11/20.
//  Copyright © 2020 Cocoacasts. All rights reserved.
//

import XCTest

extension XCTestCase {
    func loadStub(name: String, extension: String) -> Data {
        let bundle = Bundle(for: type(of: self))
        let url = bundle.url(forResource: name, withExtension: `extension`)
        
        return try! Data(contentsOf: url!)
    }
}
