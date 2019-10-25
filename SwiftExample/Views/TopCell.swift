//
//  TopCell.swift
//  SwiftExample
//
//  Created by Satoshi Ito on 2019/10/25.
//  Copyright © 2019 Satoshi Ito. All rights reserved.
//

import UIKit

class TopCell: UITableViewCell {

    /// セルのidentifier
    static let identifier = "TopCell"

    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension TopCell {
    func setup(title: String) {
        titleLabel.text = title
    }
}
