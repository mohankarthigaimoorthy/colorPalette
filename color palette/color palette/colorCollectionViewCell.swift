//
//  colorCollectionViewCell.swift
//  color palette
//
//  Created by Imcrinox Mac on 03/01/1445 AH.
//

import UIKit

class colorCollectionViewCell: UICollectionViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
        override func draw(_ rect: CGRect) {

        super.draw(rect)
              self.layer.cornerRadius = self.frame.size.width / 2
//        contentView.layer.cornerRadius = contentView.layer.frame.width / 2
    }
}
