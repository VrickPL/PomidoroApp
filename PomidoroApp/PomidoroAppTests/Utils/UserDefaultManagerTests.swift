//
//  UserDefaultManagerTests.swift
//  PomidoroAppTests
//
//  Created by Jan Kazubski on 31/08/2024.
//

import Testing

@testable import PomidoroApp

struct UserDefaultManagerTests {
    
    @Test
    func testBasic() {
        #expect(UserDefaultsManager.defaultWorkTime == 1500)
        #expect(UserDefaultsManager.defaultBreakTime == 300)
    }
}
