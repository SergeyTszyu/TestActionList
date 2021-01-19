//
//  MainViewController.swift
//  TestActionList
//
//  Created by Sergey Tszyu on 19.01.2021.
//

import UIKit

final class MainViewController: UIViewController {
    
    // MARK: - @IBOutlets
    
    // MARK: - Properties
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
}

// MARK: - Private

private extension MainViewController {
    
    func configure() {
        
    }
    
    @IBAction func showActionList(_ sender: UIButton) {
        let actionController = ActionListViewController()
        actionController.modalPresentationStyle = .overFullScreen
        actionController.modalTransitionStyle = .crossDissolve
        present(actionController, animated: true, completion: nil)
    }
}

// MARK: - ActionListViewControllerDelegate

extension MainViewController: ActionListViewControllerDelegate {
    
    func osagoQuestionnaireInputViewController(_ controller: ActionListViewController,
                                               selectItem item: ActionListItem) {
        
        print("selected item: \(item.titleItem)")
    }
}
