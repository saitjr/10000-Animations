//
//  ViewController.swift
//  10000-Animations
//
//  Created by saitjr on 9/16/16.
//  Copyright © 2016 saitjr. All rights reserved.
//

import UIKit

private struct Const {
    static let cellIdentifier: String = "Cell"
    static let jsonPath = Bundle.main.path(forResource: "Model", ofType: "json")
}

class ViewController: UIViewController {
    
    fileprivate var dataSource: [Model] = []
    fileprivate var tableView: UITableView?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupUI()
        setupData()
    }
}

extension ViewController {
    func setupUI() {
        view.backgroundColor = .red
        title = "Animations"
        
        tableView = UITableView()
        tableView!.frame = view.bounds
        tableView!.rowHeight = 50
        tableView!.delegate = self
        tableView!.dataSource = self
        view.addSubview(tableView!)
    }
    
    func setupData() {
        guard let path = Const.jsonPath, let data = jsonToArray(path: path) else {
            return
        }
        for dict in data {
            guard let anyClass = st.classFromString(name: dict["type"] ?? "") else {
                continue
            }
            let title: String = dict["title"] ?? ""
            let status: Bool = dict["status"] ?? "" == "1"
            let description: String = dict["description"] ?? ""
            let action: ActionType = ActionType(rawValue: dict["action"] ?? "push")!
            let model = Model(title: title, type: anyClass, status: status, description: description, action: action)
            dataSource.append(model)
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Const.cellIdentifier) ?? UITableViewCell(style: .subtitle, reuseIdentifier: Const.cellIdentifier)
        cell.textLabel?.font = UIFont(name: ProjectConfig.lightFontName, size: 20)
        cell.textLabel?.text = dataSource[indexPath.row].title
        cell.detailTextLabel?.text = (dataSource[indexPath.row].status ? "done!" : "not finish yet") + "  " + dataSource[indexPath.row].description
        cell.detailTextLabel?.textColor = dataSource[indexPath.row].status ? .gray : .red
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let type: UIViewController.Type = dataSource[indexPath.row].type as? UIViewController.Type else {
            return
        }
        let vc = type.init()
        vc.title = dataSource[indexPath.row].title
        if dataSource[indexPath.row].action == .push {
            navigationController?.pushViewController(vc, animated: true)
        } else {
            navigationController?.present(vc, animated: true, completion: nil)
        }
    }
}
