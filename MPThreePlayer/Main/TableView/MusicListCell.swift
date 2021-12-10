//
//  MusicListCell.swift
//  MPThreePlayer
//
//  Created by devming on 2021/12/10.
//

import UIKit

class MusicListCell: UITableViewCell {
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        return label
    }()
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    private func setupViews() {
        contentView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: titleLabel.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
        ])
    }
    
    func configure(_ item: MusicFile) {
        titleLabel.text = item.subject
    }
}
