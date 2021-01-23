//
//  UserCell.swift
//  Chat App
//
//  Created by Nitin Patil on 16/01/21.
//

import Foundation
import UIKit
//
class UserCell : UITableViewCell {
    
    var data:EntryItem?{
        didSet{
            manageData()
        }
    }

    let nameLabel:UILabel = {
        let name = UILabel()
        name.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        name.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        name.font = UIFont.systemFont(ofSize: 18)
        return name
    }()
    
    let postLabel:UILabel = {
        let name = UILabel()
        name.numberOfLines = 1
        name.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        name.font = UIFont.systemFont(ofSize: 15)
        return name
    }()
    
    let imgView:UIImageView = {
        let iv  = UIImageView()
        iv.image = UIImage(named: "rock.jpg")
        iv.contentMode = .scaleAspectFit
        iv.layer.borderWidth = 1.0
        iv.layer.masksToBounds = false
        iv.layer.borderColor = UIColor.white.cgColor
        iv.layer.cornerRadius = 30
        iv.clipsToBounds = true
        return iv
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    

    
    func configureUI(){
        addSubview(imgView)
        addSubview(nameLabel)
        addSubview(postLabel)
        setUpConstraints()
    }
    
  
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpConstraints(){
        imgView.anchor(top:topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nameLabel.leftAnchor, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 5, width: 60, height: 60)
        imgView.layer.cornerRadius = 30
        nameLabel.anchor(top:topAnchor, left: imgView.rightAnchor, bottom: postLabel.topAnchor, right: rightAnchor, paddingTop: 5, paddingLeft: 5, paddingBottom: 2, paddingRight: 5, height: 35)
        postLabel.anchor(top:nameLabel.bottomAnchor, left: imgView.rightAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 5, paddingLeft: 5, paddingBottom: 2, paddingRight: 5, height: 25)
    }
    
    func manageData(){
        guard let data = data else {return}
        postLabel.text = data.getMessage()
    }

}

