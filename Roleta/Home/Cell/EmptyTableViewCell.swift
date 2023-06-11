//
//  EmptyTableViewCell.swift
//  Roleta
//
//  Created by Gabriel Mors  on 11/06/23.
//

import UIKit

class EmptyTableViewCell: UITableViewCell {

    static let identefier: String = String(describing: EmptyTableViewCell.self)
    
    lazy var logoImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "roleta")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "Insira os participantes para iniciar uma roleta russa!"
        label.textColor = .white
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .black
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configConstraints() {
        NSLayoutConstraint.activate([
        
            logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoImageView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            logoImageView.heightAnchor.constraint(equalToConstant: 140),
            logoImageView.widthAnchor.constraint(equalToConstant: 140),
        
            titleLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 20)
        ])
    }
}
