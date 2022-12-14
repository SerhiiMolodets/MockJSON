//
//  ViewController.swift
//  FakeJSON
//
//  Created by Сергей Молодец on 02.09.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userTableView: UITableView!

    private var users: [User] = []
    private var dataManager = DataManager()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        userTableView.delegate = self
        userTableView.dataSource = self
//MARK: Register nib
        let nib = UINib(nibName: "UserTableViewCell", bundle: nil)
        userTableView.register(nib, forCellReuseIdentifier: "UserTableViewCell")
//MARK: Get users

        loadUsers {
            self.userTableView.reloadData()
        }
    }
//   MARK: Get request
    private func loadUsers(completion: @escaping(() -> ())) {
        dataManager.getUsers{ [weak self] user in
            guard let self = self else { return }
            self.users = user
            completion()
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = userTableView.dequeueReusableCell(withIdentifier: "UserTableViewCell") as? UserTableViewCell else {
            return UITableViewCell()
        }
//        MARK: Configure cell
        cell.configure(user: users[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 470
    }
}

