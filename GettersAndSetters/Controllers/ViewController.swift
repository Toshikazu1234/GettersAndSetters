//
//  ViewController.swift
//  GettersAndSetters
//
//  Created by R K on 2/5/24.
//

import UIKit

final class ViewController: UIViewController {
    private let key = "SelectedName"
    private var selectedName: String? {
        get {
            UserDefaults.standard.string(forKey: key)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: key)
            title = newValue
        }
    }
    
    private var names: [User] = [] {
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
            names = [
                BasicUser(fname: "Robert", lname: "Smith", email: "bs@email.com", nickName: "Bob"),
                BasicUser(fname: "Jonathan", lname: "Cooper", email: "js@email.com", nickName: "John"),
                BasicUser(fname: "Sally", lname: "White", email: "sw@email.com"),
                AdminUser(fname: "Sarah", lname: "Chao", email: "sc@email.com", nickName: "Boss Lady"),
                BasicUser(fname: "Deborah", lname: "Ling", email: "dl@email.com", nickName: "Debby"),
                AdminUser(fname: "Carl", lname: "Jackson", email: "cj@email.com", nickName: "Boss Man"),
                BasicUser(fname: "Alex", lname: "Thomson", email: "at@email.com"),
                BasicUser(fname: "Natalie", lname: "Ramos", email: "nr@email.com"),
                BasicUser(fname: "Samuel", lname: "Rosario", email: "sr@email.com", nickName: "Sam"),
                BasicUser(fname: "Chuck", lname: "Cheese", email: "cc@email.com", nickName: "Chucky"),
                BasicUser(fname: "Andy", lname: "Lightyear", email: "al@email.com"),
                BasicUser(fname: "Lisa", lname: "Wang", email: "lw@email.com"),
                AdminUser(fname: "Steve", lname: "Mann", email: "sm@email.com")
            ]
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
        let name = names[indexPath.row]
        cell.configure(name)
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height * 0.08
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(
            at: indexPath,
            animated: true)
        let name = names[indexPath.row]
        selectedName = name.nickName
    }
}
