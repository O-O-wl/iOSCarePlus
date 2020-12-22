//
//  GameItemTableViewCell.swift
//  iOSCarePlus
//
//  Created by dongyoung.lee on 2020/12/16.
//

import Kingfisher
import UIKit

final class GameItemTableViewCell: UITableViewCell {
    @IBOutlet private weak var gameTitleLabel: UILabel!
    @IBOutlet private weak var gameImageView: UIImageView!
    @IBOutlet private weak var gameOriginPriceLabel: UILabel!
    @IBOutlet private weak var gamePriceLabel: UILabel!
    
    private var model: Game? {
        didSet { setUIFromModel() }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        gameImageView.layer.cornerRadius = 9
        gameImageView.layer.borderWidth = 1
        gameImageView.layer.borderColor = UIColor(red: 236.0 / 255.0,
                                                  green: 236.0 / 255.0,
                                                  blue: 236.0 / 255.0,
                                                  alpha: 1).cgColor
    }
    
    func setModel(_ model: Game) {
        self.model = model
    }
    
    private func setUIFromModel() {
        guard let model = model,
              let imageURL = URL(string: model.imageURL)
        else { return }
        gameImageView.kf.setImage(with: imageURL)
        gameTitleLabel.text = model.title
        if let discountPrice: Int = model.discountPrice {
            gameOriginPriceLabel.text = model.originPrice.description
            gamePriceLabel.text = discountPrice.description
        } else {
            gamePriceLabel.text = model.originPrice.description
            gameOriginPriceLabel.isHidden = true
        }
    }
}
