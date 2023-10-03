//
//  MainTableViewCell.swift
//  newsTest
//
//  Created by алексей ганзицкий on 30.08.2023.
//

import UIKit

final class MainTableViewCell: UITableViewCell {
    
    let imageBackground: UIView = {
        let imageBackground = UIView()
        imageBackground.layer.cornerRadius = Constants.imageViewCornerRadius
        imageBackground.backgroundColor = .white
        imageBackground.clipsToBounds = true
        return imageBackground
    }()
    
    let imageCell: UIImageView = {
        let imageCell = UIImageView()
        imageCell.layer.cornerRadius = Constants.imageViewCornerRadius
        imageCell.clipsToBounds = true
        return imageCell
    }()
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 6
        label.font = .systemFont(ofSize: 14)
        label.minimumScaleFactor = 8
        return label
    }()
    
    var linkCountLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.contentMode = .right
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupConstraaints()
       
        createDefaultShadow(for: imageBackground)
    }
    required init?(coder: NSCoder) {
        fatalError("init has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageCell.image = nil
        titleLabel.text = nil
        linkCountLabel.text = nil
    }
    
    private func createDefaultShadow(for myView: UIView) {
        myView.layer.shadowColor = UIColor.black.cgColor
        myView.layer.shadowOffset = CGSize(width: -1, height: 1)
        myView.layer.shadowOpacity = 1
        myView.layer.shadowRadius = Constants.imageViewCornerRadius / 3
        
        myView.clipsToBounds = false
        myView.layer.masksToBounds = false
    }
    
    func setupValuesCell(values: MainTableViewCellViewModel) {
        imageCell.image = values.image
        titleLabel.text = values.title
        linkCountLabel.text = String(values.count)
    }
    
   private func setupConstraaints() {
        [imageBackground, imageCell, titleLabel, linkCountLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        NSLayoutConstraint.activate([
            imageBackground.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.cellItemsPadding),
            imageBackground.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.cellItemsPadding),
            imageBackground.widthAnchor.constraint(equalToConstant: Constants.imageCellWidth),
            imageBackground.heightAnchor.constraint(equalToConstant: Constants.imageCellHeight),
            
            imageCell.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.cellItemsPadding),
            imageCell.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.cellItemsPadding),
            imageCell.widthAnchor.constraint(equalToConstant: Constants.imageCellWidth),
            imageCell.heightAnchor.constraint(equalToConstant: Constants.imageCellHeight),
            
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.cellItemsPadding),
            titleLabel.leadingAnchor.constraint(equalTo: imageBackground.trailingAnchor, constant: Constants.cellItemsPadding),
            titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -Constants.cellItemsPadding),
  
            linkCountLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.cellItemsPadding),
            linkCountLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constants.cellItemsPadding)
        ])
    }
}
