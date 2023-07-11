//
//  Info.swift
//  ASConcentration
//
//  Created by Sergey Antoniuk on 2.08.22.
//

import Foundation

struct Info: Codable, Equatable {
	let date: Date
	let duration: Int

	static func == (lhs: Self, rhs: Self) -> Bool {
		return lhs.duration == rhs.duration
	}
}
