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
    
    private var users: [User] = [] {
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
            users = [
                BasicUser(fname: "Robert", lname: "Smith", email: "bs@email.com", dob: "01/01/1992", nickName: "Bob"),
                BasicUser(fname: "Jonathan", lname: "Cooper", email: "js@email.com", dob: "03/20/1993", nickName: "John"),
                BasicUser(fname: "Sally", lname: "White", email: "sw@email.com", dob: "10/07/2000"),
                AdminUser(fname: "Sarah", lname: "Chao", email: "sc@email.com", dob: "08/08/1988", nickName: "Boss Lady"),
                BasicUser(fname: "Deborah", lname: "Ling", email: "dl@email.com", dob: "06/30/2001", nickName: "Debby"),
                AdminUser(fname: "Carl", lname: "Jackson", email: "cj@email.com", dob: "11/11/1990", nickName: "Boss Man"),
                BasicUser(fname: "Alex", lname: "Thomson", email: "at@email.com", dob: "07/08/1997"),
                BasicUser(fname: "Natalie", lname: "Ramos", email: "nr@email.com", dob: "08/09/1997"),
                BasicUser(fname: "Samuel", lname: "Rosario", email: "sr@email.com", dob: "11/10/1999", nickName: "Sam"),
                BasicUser(fname: "Chuck", lname: "Cheese", email: "cc@email.com", dob: "04/18/1996", nickName: "Chucky"),
                BasicUser(fname: "Andy", lname: "Lightyear", email: "al@email.com", dob: "05/29/1987"),
                BasicUser(fname: "Lisa", lname: "Wang", email: "lw@email.com", dob: "09/13/2003"),
                AdminUser(fname: "Steve", lname: "Mann", email: "sm@email.com", dob: "09/26/2002")
            ]
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: TestRow.id,
            for: indexPath) as! TestRow
        let user = users[indexPath.row]
        cell.configure(user)
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
        let user = users[indexPath.row]
        selectedName = "\(user.nickName) age: \(user.age)"
    }
}
