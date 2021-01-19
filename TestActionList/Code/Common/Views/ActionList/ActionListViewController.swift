//
//  ActionListViewController.swift
//  TestActionList
//
//  Created by Sergey Tszyu on 19.01.2021.
//

import UIKit

fileprivate struct Constans {
    static let cellHeight: CGFloat = 48.0
    static let topSpacing: CGFloat = 8.0       // Отступ сверху
    static let bottomSpacing: CGFloat = 48.0   // Отступ снизу
}

protocol ActionListViewControllerDelegate: class {
    func osagoQuestionnaireInputViewController(_ controller: ActionListViewController,
                                               selectItem item: ActionListItem)
}

final class ActionListViewController: UIViewController {
    
    // MARK: - @IBOutlets
    
    @IBOutlet private weak var tapView: UIView!
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
            self.view.backgroundColor = UIColor.black.withAlphaComponent(0.24)
        }
    }
}

// MARK: - Private

private extension ActionListViewController {
    
    func configure() {
        tableView.register(R.nib.actionListCell)
        menuView.corners = [.topLeft, .topRight]
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapGesture))
        tapView.addGestureRecognizer(tapGestureRecognizer)
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
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let actionCell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.actionListCell, for: indexPath)!
        return actionCell
    }
}
