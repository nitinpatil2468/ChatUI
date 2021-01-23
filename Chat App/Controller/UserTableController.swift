//
//  UserTableController.swift
//  Chat App
//
//  Created by Nitin Patil on 16/01/21.
//

import UIKit

protocol UserTableDelegate {
    func reloadTable()
}

class UserTableController: UIViewController {
 
    // Mark: - Properties
    

        lazy var tableView:UITableView = {
    
        let tv = UITableView(frame: .zero)
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.showsHorizontalScrollIndicator = false
        tv.delegate = self
        tv.dataSource = self
        tv.register(UserCell.self, forCellReuseIdentifier: "cell")
        tv.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        tv.tableFooterView = UIView()
        tv.rowHeight = UITableView.automaticDimension;
        tv.estimatedRowHeight = UITableView.automaticDimension;
        return tv
    
    }()
    
    var user : UserInfo?
    var chatArray = [EntryItem]()
    
    override func viewDidLoad(){
        configureUI()
        reloadTable()
    }
    
    func configureUI(){
        self.navigationItem.title = "Whats up"
        view.addSubview(tableView)
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        tableView.anchor(top: view.layoutMarginsGuide.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)

    }
    
}

extension UserTableController: UITableViewDelegate,UITableViewDataSource,UserTableDelegate{
    
    func reloadTable() {
        var entries = [User]()
        entries = UserDBHelper.sharedInstance.getEntries()!
        if let userInfo = entries.last{
            user = UserInfo()
            tableView.reloadData()
        }
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! UserCell
        cell.nameLabel.text = "Dwayne Johnson"
        cell.data = user?.getChats()?.last
        cell.selectionStyle = .none
        return cell
    }
    
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 70
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ChatDetailsController()
        vc.UserDelegate = self
        chatArray = user?.getChats() ?? []
        vc.objArray = chatArray
        let nav = UINavigationController(rootViewController: vc )
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: true, completion: nil)
    }

}
