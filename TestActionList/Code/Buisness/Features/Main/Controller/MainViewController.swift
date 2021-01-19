//
//  MainViewController.swift
//  TestActionList
//
//  Created by Sergey Tszyu on 19.01.2021.
//

import UIKit

final class MainViewController: UIViewController {
    
    // MARK: - @IBOutlets
    
    @IBOutlet private weak var selectedItemLabel: UILabel!
    
    // MARK: - Properties
    
    fileprivate lazy var actionList: ActionListViewController = {
        let actionController = ActionListViewController()
        actionController.modalPresentationStyle = .overFullScreen
        actionController.modalTransitionStyle = .crossDissolve
        actionController.actionListType = .all
        actionController.delegate = self
        return actionController
    }()
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

// MARK: - Private

private extension MainViewController {
    
    @IBAction func showActionList(_ sender: UIButton) {
        present(actionList, animated: true, completion: nil)
    }
}

// MARK: - ActionListViewControllerDelegate

extension MainViewController: ActionListViewControllerDelegate {
    
    func osagoQuestionnaireInputViewController(_ controller: ActionListViewController,
                                               selectItem item: ActionListItem) {
        
        selectedItemLabel.text = item.titleItem
    }
}
