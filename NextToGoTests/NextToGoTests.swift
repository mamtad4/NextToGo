//
//  NextToGoTests.swift
//  NextToGoTests
//
//  Created by Mamta Devi on 23/8/2023.
//

import XCTest
@testable import NextToGo

final class NextToGoTests: XCTestCase {
    var sut: RaceViewModel!
    
    @MainActor override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        sut = RaceViewModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        try super.tearDownWithError()
        sut = nil
    }
    
    @MainActor func testResultsFiltersAreWorking() {
        //Given
        let mockRaceDataModel:[String:RaceDataModel] = ["id1" : RaceDataModel.data[0],
                                                        "id2" : RaceDataModel.data[1],
                                                        "id3" : RaceDataModel.data[2],
                                                        "id4" : RaceDataModel.data[0],
                                                        "id5" : RaceDataModel.data[4],
                                                        "id6" : RaceDataModel.data[3]]
        //When
        sut.filterData(response: mockRaceDataModel)
        //Then
        XCTAssertEqual(sut.results.count > 0, true,"Results are filetering correct from response")
    }

}
