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
            let model = Model(title: dict["title"] ?? "", type: anyClass)
            dataSource.append(model)
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Const.cellIdentifier) ?? UITableViewCell()
        cell.textLabel?.font = UIFont(name: ProjectConfig.lightFontName, size: 20)
        cell.textLabel?.text = dataSource[indexPath.row].title
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
        navigationController?.pushViewController(vc, animated: true)
    }
}
