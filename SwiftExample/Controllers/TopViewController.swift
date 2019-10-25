//
//  TopViewController.swift
//  SwiftExample
//
//  Created by Satoshi Ito on 2019/10/25.
//  Copyright © 2019 Satoshi Ito. All rights reserved.
//

import UIKit

class TopViewController: UIViewController {

    //  MARK: - Property
    let items = ["Closure", "String"]
    
    //  MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    //  MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //  選択状態解除
        tableView.indexPathsForSelectedRows?.forEach { [unowned self] in
            self.tableView.deselectRow(at: $0, animated: false)
        }
    }
}

//  MARK: - UITableViewDataSource
extension TopViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TopCell.identifier) as! TopCell
        cell.setup(title: items[indexPath.row])
        return cell
    }
}

//  MARK: - UITableViewDelegate
extension TopViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        switch indexPath.row {
        case 0:
            let storyboard = UIStoryboard(name: ClosureViewController.storyboardName, bundle: nil)
            guard let vc = storyboard.instantiateInitialViewController() as? ClosureViewController else { return }
            self.navigationController?.pushViewController(vc, animated: true)
            vc.testClosure = { [weak self] str in
                self?.showAlert(message: str)
            }
        default:
            break
        }
    }
}
