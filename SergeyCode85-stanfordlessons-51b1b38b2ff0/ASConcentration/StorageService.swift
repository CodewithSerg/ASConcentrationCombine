//
//  StorageService.swift
//  ASConcentration
//
//  Created by Sergey Antoniuk on 17.07.22.
//

import RealmSwift

protocol Storable {
	func save(info: Info)
	func readInfo() -> [Info]
}

final class StorageService {

	private var realm: Realm?
	init() {
		realm = try? Realm()
	}

	private func readObjects<Element: Object>(_ type: Element.Type) -> Results<Element>? {
		realm?.objects(type)
	}

	private func save<Element: Object>(_ object: Element) {
		do {
			try realm?.write {
				realm?.add(object)
			}
		} catch let error as NSError {
			print(error.localizedDescription)
		}
	}
}

// MARK: - External methods for work with service

extension StorageService : Storable {
	func save(info: Info) {
		let infoObject = InfoObject(date: info.date, duration: info.duration)
		save(infoObject)
	}

	func readInfo() -> [Info] {
		let infoObj = readObjects(InfoObject.self)
		return Array(infoObj!).map { $0.toModel() }.suffix(5) // last 5 objects
	}
}
