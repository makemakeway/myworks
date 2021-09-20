//
//  RegionTableViewCell.swift
//  Carrot
//
//  Created by 박연배 on 2021/09/09.
//

import UIKit

class RegionTableViewCell: UITableViewCell {

    var regionImageView = UIImageView()
    var hashTag = UILabel()
    var contents = UILabel()
    var nickName = UILabel()
    var region = UILabel()
    var timestamp = UILabel()
    var comments = UILabel()
    var likes = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(regionImageView)
        addSubview(hashTag)
        addSubview(contents)
        addSubview(nickName)
        addSubview(timestamp)
        addSubview(comments)
        addSubview(likes)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
