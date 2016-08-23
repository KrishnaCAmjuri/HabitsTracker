
//
//  HabitsTableViewCell.swift
//  Me_N_Myself
//
//  Created by KrishnaChaitanya Amjuri on 22/08/16.
//  Copyright © 2016 Krishna Chaitanya. All rights reserved.
//

import UIKit

class HabitsTableViewCell: UITableViewCell {

    let label: UILabel = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: UITableViewCellStyle.Default, reuseIdentifier: reuseIdentifier)
        
        label.text = "Demo"
        label.textAlignment = NSTextAlignment.Left
        label.font = UIFont.systemFontOfSize(16);
        self.contentView.addSubview(label)
        
        label.snp_makeConstraints { (make) in
            make.edges.equalTo(self.contentView).inset(UIEdgeInsetsMake(2.5, 10, 2.5, 10));
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
