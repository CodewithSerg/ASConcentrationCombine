//
//  FakeStorageManager.swift
//  ASConcentration
//
//  Created by Sergey Antoniuk on 2.08.22.
//

import Foundation
import Combine

protocol FakeStorageManagerProtocol {
	func bindInfo() -> AnyPublisher<[Info], Never>
	func takeInfoFromDB()
}

final class FakeStorageManager: FakeStorageManagerProtocol {

	var storage: Storable
	private let infoPublisher = PassthroughSubject<[Info], Never>()

	init(storage: Storable) {
		self.storage = storage
	}

	func takeInfoFromDB() {
		let data = storage.readInfo()
		infoPublisher.send(Array(data))
	}

	func bindInfo() -> AnyPublisher<[Info], Never> {
		return infoPublisher.eraseToAnyPublisher()
	}
}
