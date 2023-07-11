//
//  ASConcentrationTests.swift
//  ASConcentrationTests
//
//  Created by Sergey Antoniuk on 18.12.22.
//

import XCTest
//import Combine
@testable import ASConcentration

final class ASConcentrationTests: XCTestCase {
	private var mockStorage : Storable!
	private var mockStorageManager: FakeStorageManagerProtocol!
	var sut: StatisticModel!

    override func setUp() {
		mockStorage = MockStorage()
		mockStorageManager = FakeStorageManager(storage: mockStorage)
		sut = StatisticModel(storageManager: mockStorageManager)
    }

    override func tearDown() {
		sut = nil
    }

    func test_after_sut_intit_will_Bind_and_only_than_takeData() {
		let testData = ASConcentration.Info(date: Date(), duration: 5)
		XCTAssertEqual(sut.infoData.count, 1)
		XCTAssertEqual(sut.infoData.first?.duration, testData.duration)
		XCTAssertEqual(sut.infoData, [testData])
    }
}

final class MockStorageManager: StatisticModelProtocol {
	var infoData: [ASConcentration.Info] = [ASConcentration.Info]()

	func bindForInfo() {

	}
}

final class MockStorage: Storable {

	var infoData: [ASConcentration.Info] = [ASConcentration.Info(date: Date(), duration: 5)]

	func save(info: ASConcentration.Info) {
		infoData.append(info)
	}

	func readInfo() -> [ASConcentration.Info] {
		infoData
	}
}
