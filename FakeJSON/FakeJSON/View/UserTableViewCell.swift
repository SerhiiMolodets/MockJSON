//
//  UserTableViewCell.swift
//  FakeJSON
//
//  Created by Сергей Молодец on 02.09.2022.
//

import UIKit
import Kingfisher

class UserTableViewCell: UITableViewCell {
    @IBOutlet weak var avatarView: UIImageView!
    @IBOutlet weak var nickNameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var mailLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

                contentView.layer.cornerRadius = 15
        if let patternImage = UIImage(named: "pattern") {
            contentView.backgroundColor = UIColor(patternImage: patternImage)
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }
    
    
    func configure(user: User) {
        guard let url = URL(string: user.avatar) else { return }
        avatarView.kf.setImage(with: url)
        self.nickNameLabel.text = user.nickname
        self.nameLabel.text = user.firstName + " " + user.lastName
        self.mailLabel.text = user.email
        

    }
}

