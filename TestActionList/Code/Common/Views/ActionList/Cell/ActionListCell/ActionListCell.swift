//
//  ActionListCell.swift
//  TestActionList
//
//  Created by Sergey Tszyu on 19.01.2021.
//

import UIKit

struct Action: ActionListItem {
    var titleItem: String
    var image: UIImage
    var color: UIColor
}

final class ActionListCell: UITableViewCell {
    
    // MARK: - @IBOutlets
    
    @IBOutlet private weak var actionImageView: UIImageView!
    @IBOutlet private weak var actionNameLabel: UILabel!
    
    // MARK: - Life cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        actionNameLabel.text = nil
        actionImageView.isHidden = true
        actionImageView.tintColor = .clear
    }
}

// MARK: - Public

extension ActionListCell {
    
    func fill(_ item: ActionListItem) {
        actionNameLabel.text = item.titleItem
        actionNameLabel.textColor = .primary
        actionImageView.image = item.image
        actionImageView.tintColor = item.color
    }
}
