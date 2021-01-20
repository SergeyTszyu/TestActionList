//
//  ActionListViewController.swift
//  TestActionList
//
//  Created by Sergey Tszyu on 19.01.2021.
//

import UIKit

fileprivate struct Constans {
    static let alpha: CGFloat = 0.24
    static let cellHeight: CGFloat = 48.0
}

protocol ActionListViewControllerDelegate: class {
    func actionListViewController(_ controller: ActionListViewController,
                                               selectItem item: ActionListItem)
}

final class ActionListViewController: UIViewController {
    
    // MARK: - @IBOutlets
    
    @IBOutlet private weak var tapView: UIView!
    @IBOutlet private weak var menuView: CornerView!
    @IBOutlet private weak var tableView: UITableView!
    
    @IBOutlet private weak var tableViewHeight: NSLayoutConstraint!
    
    // MARK: - Properties
    
    weak var delegate: ActionListViewControllerDelegate?
    
    fileprivate var cellObjects: [ActionListItem] {
        let factory = ActionListCellObjectsFactory()
        let objects = factory.cellObjects(actionListType)
        tableViewHeight.constant = (Constans.cellHeight * CGFloat(objects.count))
        return objects
    }
    
    var actionListType: ActionListType = .all
    
    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        UIView.animate(withDuration: 0.3) {
            self.view.backgroundColor = UIColor.black.withAlphaComponent(Constans.alpha)
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
        let item = cellObjects[indexPath.row]
        delegate?.actionListViewController(self, selectItem: item)
        dismissAction()
    }
}

// MARK: - UITableViewDataSource

extension ActionListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellObjects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = cellObjects[indexPath.row]
        let actionCell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.actionListCell, for: indexPath)!
        actionCell.fill(item)
        
        return actionCell
    }
}
