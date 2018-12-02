//
//  CustomTableViewCell.swift
//  UIProgramatically
//
//  Created by anoop on 2018-11-28.
//  Copyright © 2018 anoop. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    let titleLabel: UILabel!
    let subTitleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {

        self.titleLabel = ViewFactory.createUILabel()
        self.subTitleLabel = ViewFactory.createUILabel()
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpViews()

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setUpViews() {

        contentView.addSubview(titleLabel)
        contentView.addSubview(subTitleLabel)
        let marginGuide = contentView.layoutMarginsGuide
        titleLabel.topAnchor.constraint(equalTo: marginGuide.topAnchor, constant: 5).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: marginGuide.leftAnchor, constant: 5).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: marginGuide.rightAnchor, constant: -5).isActive = true

        subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5).isActive = true
        subTitleLabel.leftAnchor.constraint(equalTo: marginGuide.leftAnchor, constant: 5).isActive = true
        subTitleLabel.rightAnchor.constraint(equalTo: marginGuide.rightAnchor, constant: -5).isActive = true
        subTitleLabel.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor, constant: 5).isActive = true

    }
}
