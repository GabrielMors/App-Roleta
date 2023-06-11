//
//  PersonTableViewCell.swift
//  Roleta
//
//  Created by Gabriel Mors  on 11/06/23.
//

import UIKit

class PersonTableViewCell: UITableViewCell {

    static let identifier: String = String(describing: PersonTableViewCell.self)
    
    lazy var personImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubViews()
        configConstraints()
    }
    
    private func addSubViews() {
        addSubview(personImageView)
        addSubview(nameLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setupCell(data: Person) {
        nameLabel.text = data.name
        personImageView.image = UIImage(named: data.image)
    }
    
    private func configConstraints() {
        
    }
}
