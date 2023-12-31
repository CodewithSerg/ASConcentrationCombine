//
//  CustomCell.swift
//  ASConcentration
//
//  Created by Sergey Antoniuk on 17.07.22.
//

import UIKit

final class CustomCell: UITableViewCell {

	static let reuseIdentifier = "CustomCell"

	let infoLabel: UILabel = {
		let label = UILabel()
		label.numberOfLines = 0
		label.font = .systemFont(ofSize: 20)
		label.textColor = .blue
		label.textAlignment = .center
		return label
	}()

	var dateFormatter: DateFormatter {
		let formatter = DateFormatter()
		formatter.timeStyle = .medium
		formatter.dateStyle = .medium
		return formatter
	}

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: .value1, reuseIdentifier: reuseIdentifier)
		setupView()
	}

	required init?(coder: NSCoder) {
		super.init(coder: coder)
	}

	private func setupView() {
		addSubview(infoLabel)
		infoLabel.snp.makeConstraints {
			$0.centerY.equalToSuperview()
			$0.height.equalToSuperview().inset(20)
			$0.leading.trailing.equalToSuperview().inset(24)
		}
	}

	func configureCell(with info: Info) {
		infoLabel.text = "\(dateFormatter.string(from: info.date)) Result was : \(info.duration)"
	 }
}
