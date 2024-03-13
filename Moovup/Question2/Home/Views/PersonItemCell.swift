//
//  PersonItemCell.swift
//  Moovup
//
//  Created by Ding Lo on 13/3/2024.
//

import UIKit

class PersonItemCell: UITableViewCell {
    // lazy
    lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .black
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    private func setupUI() {
        let containerView = UIView()
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 8
        containerView.layer.borderWidth = 1
        containerView.layer.borderColor = UIColor.gray.cgColor
        
        contentView.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.bottom.equalToSuperview().inset(16)
        }
        
        // icon
        containerView.addSubview(iconImageView)
        iconImageView.snp.makeConstraints { make in
            make.top.leading.bottom.equalToSuperview().inset(16)
            make.width.height.equalTo(50)
        }
        iconImageView.layer.cornerRadius = iconImageView.frame.height / 2
        
        // name
        containerView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.centerX.equalTo(iconImageView)
            make.leading.equalTo(iconImageView.snp.trailing).inset(16)
            make.trailing.equalToSuperview().inset(16)
        }
    }

}
