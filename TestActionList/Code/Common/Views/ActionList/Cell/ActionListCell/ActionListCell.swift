//
//  ActionListCell.swift
//  TestActionList
//
//  Created by Sergey Tszyu on 19.01.2021.
//

import UIKit

protocol ActionListItem {
    var titleItem: String { get }
    var image: String { get }
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
    }
}

// MARK: - Public

extension ActionListCell {
    
    func fill(_ item: ActionListItem) {
        
    }
}
