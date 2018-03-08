//
//  UserCell.swift
//  Cudate!
//
//  Created by Michael Doroff on 3/7/18.
//  Copyright © 2018 Michael Doroff. All rights reserved.
//

import Foundation
import LBTAComponents

class UserCell: DatasourceCell {
   
    let profileImageView: CachedImageView = {
        let imageView = CachedImageView()
        imageView.image = #imageLiteral(resourceName: "profile_image")
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        return imageView
        
    }()
    
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Brian Voong"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
        
    }()
    
    
    let usernameLabel: UILabel = {
        let usernameLabel = UILabel()
        usernameLabel.text = "@buildthatapp"
        usernameLabel.font = UIFont.systemFont(ofSize: 14)
        usernameLabel.textColor = UIColor(r: 130, g: 130, b: 130)
        return usernameLabel
        
    }()
    
    
    let bioTextView: UITextView = {
        let textView = UITextView()
        textView.text = "iPhone, iPad, iOS Community. Join us to learn Swift, Objective-C and build iOS apps."
        textView.backgroundColor = .clear
        textView.font = UIFont.systemFont(ofSize: 15)
        return textView
        
    }()
    
    let followButton: UIButton = {
        
        let followButton = UIButton()
        followButton.layer.cornerRadius = 5
        followButton.layer.borderWidth = 1
        followButton.setTitle("Follow", for: .normal)
        followButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        return followButton
    }()
    
    
    override func setupViews() {
        super.setupViews()
        
        
        backgroundColor = .white
        
        
        separatorLineView.isHidden = false
        
        
        addSubview(profileImageView)
        addSubview(nameLabel)
        addSubview(usernameLabel)
        addSubview(bioTextView)
        addSubview(followButton)
        
        profileImageView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        
        
        nameLabel.anchor(profileImageView.topAnchor, left: profileImageView.rightAnchor, bottom: nil, right: followButton.leftAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 12, widthConstant: 0, heightConstant: 20)
        
        usernameLabel.anchor(nameLabel.bottomAnchor, left: nameLabel.leftAnchor, bottom: nil, right: nameLabel.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 20)
        
        
        bioTextView.anchor(usernameLabel.bottomAnchor, left: usernameLabel.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: -2, leftConstant: -4, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        followButton.anchor(self.topAnchor, left: nil, bottom: nil, right: self.rightAnchor, topConstant: 12, leftConstant: 0, bottomConstant: 0, rightConstant: 12, widthConstant: 120, heightConstant: 34)
        
    }
    
}
