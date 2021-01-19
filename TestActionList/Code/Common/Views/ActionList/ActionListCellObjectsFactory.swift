//
//  ActionListCellObjectsFactory.swift
//  TestActionList
//
//  Created by Sergey Tszyu on 20.01.2021.
//

import UIKit

protocol ActionListItem {
    var titleItem: String   { get }
    var image: UIImage      { get }
    var color: UIColor      { get }
}

enum ActionListType: Int {
    case red
    case black
    case all
}

final class ActionListCellObjectsFactory {
    
    func cellObjects(_ listType: ActionListType) -> [ActionListItem] {
        
        let edit = Action(titleItem: "Edit", image: R.image.edit()!, color: .primary)
        let markUncomplete = Action(titleItem: "Mark as Uncomplete", image: R.image.checkn()!, color: .decline)
        let markUnpaid = Action(titleItem: "Mark as Unpaid", image: R.image.paymentopt()!, color: .decline)
        let editViewNotes = Action(titleItem: "Edit / View Notes", image: R.image.notes()!, color: .primary)
        let delete = Action(titleItem: "Delete", image: R.image.delete()!, color: .primary)
        
        switch listType {
        case .red:
            return [markUncomplete, markUnpaid]
        case .black:
            return [edit, editViewNotes, delete]
        case .all:
            return [edit, markUncomplete, markUnpaid, editViewNotes, delete]
        }
    }
    
}
