//
//  TestRow.swift
//  GettersAndSetters
//
//  Created by R K on 2/5/24.
//

import UIKit

final class TestRow: UITableViewCell {
    static let id = "TestRow"

    @IBOutlet private weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(_ user: User) {
        nameLabel.text = user.nickName
    }
}
