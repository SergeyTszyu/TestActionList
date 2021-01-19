//
//  ActionListCell.swift
//  TestActionList
//
//  Created by Sergey Tszyu on 19.01.2021.
//

import UIKit

protocol ActionListItem {
    var titleItem: String { get }
    var image: UIImage { get }
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
    }
}

// MARK: - Public

extension ActionListCell {
    
    func fill(_ item: ActionListItem) {
        actionNameLabel.text = item.titleItem
        actionImageView.image = item.image
    }
}
