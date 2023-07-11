//
//  StatistcModel.swift
//  ASConcentration
//
//  Created by Sergey Antoniuk on 17.07.22.
//

import Foundation
import UIKit
import Combine

protocol StatisticModelProtocol {
	var infoData: [Info] { get }
	func bindForInfo()
}

final class StatisticModel: StatisticModelProtocol {

	enum Input {
		case needUpdateTableView
	}
	// Datasource for tableView
	private (set) var infoData = [Info]()

	private let storageManager: FakeStorageManagerProtocol
	private var bag = Set<AnyCancellable>()

	init(storageManager: FakeStorageManagerProtocol) {
		self.storageManager = storageManager
		bindForInfo()
	}

	func bindForInfo() {
		storageManager.bindInfo()
			.sink { [weak self] infoData in
				guard let self = self else {return}
				self.infoData = infoData
			}
			.store(in: &bag)
		// TODO after viewDidLoad 
		storageManager.takeInfoFromDB()
	}
}
