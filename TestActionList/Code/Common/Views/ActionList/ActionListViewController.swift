//
//  ActionListViewController.swift
//  TestActionList
//
//  Created by Sergey Tszyu on 19.01.2021.
//

import UIKit

fileprivate struct Constans {
    static let cellHeight: CGFloat = 48.0
}

protocol ActionListViewControllerDelegate: class {
    func osagoQuestionnaireInputViewController(_ controller: ActionListViewController,
                                               selectItem item: ActionListItem)
}

final class ActionListViewController: UIViewController {
    
    // MARK: - @IBOutlets
    
    @IBOutlet private weak var menuView: CornerView!
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Properties
    
    weak var delegate: ActionListViewControllerDelegate?
    
    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
         
        UIView.animate(withDuration: 0.3) {
            self.view.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        }
    }
}

// MARK: - Private

private extension ActionListViewController {
    
    func configure() {
        menuView.corners = [.topLeft, .topRight]
    }
    
    @objc func tapGesture(_ recognzier: UITapGestureRecognizer) {
        dismissAction()
    }
}

// MARK: - UITableViewDelegate

extension ActionListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constans.cellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = 
        dismissAction()
    }
}

// MARK: - UITableViewDataSource

extension ActionListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
