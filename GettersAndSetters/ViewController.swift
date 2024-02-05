//
//  ViewController.swift
//  GettersAndSetters
//
//  Created by R K on 2/5/24.
//

import UIKit

final class ViewController: UIViewController {
    private let key = "SelectedName"
    private var selectedName: String {
        get {
            UserDefaults.standard.string(forKey: key) ?? ""
        }
        set {
            UserDefaults.standard.set(newValue, forKey: key)
        }
    }
    
    private var names: [String] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = selectedName
        tableView.dataSource = self
        tableView.delegate = self
        fetchNames()
    }
    
    private func fetchNames() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            guard let self else { return }
            names = ["Bob", "John", "Sally", "Sarah", "Debby", "Carl", "Alex", "Natalie", "Sam", "Chuck", "Andy", "Lisa"]
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: TestRow.id,
            for: indexPath) as! TestRow
        cell.configure(names[indexPath.row])
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height * 0.22
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(
            at: indexPath,
            animated: true)
        let name = names[indexPath.row]
        selectedName = name
    }
}
