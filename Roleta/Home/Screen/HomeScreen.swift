//
//  HomeScreen.swift
//  Roleta
//
//  Created by Gabriel Mors  on 11/06/23.
//

import UIKit

class HomeScreen: UIView {

    lazy var logoImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "card")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont.systemFont(ofSize: 18)
        textField.placeholder = "type your name:"
        textField.autocorrectionType = .no
        textField.spellCheckingType = .no
        textField.keyboardType = .default
        textField.backgroundColor = .white
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 10
        textField.clearsOnInsertion = true
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: textField.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        return textField
    }()
    
    lazy var raffleNumberButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Sortear", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.blue
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        return button
    }()
    
    @objc private func tappedButton() {
        
    }
    
    lazy var tableView: UITableView = {
       let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = .black
        tableView.register(EmptyTableViewCell.self, forCellReuseIdentifier: EmptyTableViewCell.identifier)
        tableView.register(PersonTableViewCell.self, forCellReuseIdentifier: PersonTableViewCell.identifier)
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubView()
        configConstraints()
    }
    
    private func addSubView() {
        addSubview(logoImageView)
        addSubview(nameTextField)
        addSubview(raffleNumberButton)
        addSubview(tableView)
    }
    
    public func configTableView(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        tableView.delegate = delegate
        tableView.dataSource = dataSource
    }
    
    public func textFieldDelegate(delegate: UITextFieldDelegate) {
        nameTextField.delegate = delegate
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
        
            logoImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
            logoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            logoImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
            
            nameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 15),
            nameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            nameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            nameTextField.heightAnchor.constraint(equalToConstant: 40),
            
            raffleNumberButton.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 15),
            raffleNumberButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            raffleNumberButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            raffleNumberButton.heightAnchor.constraint(equalToConstant: 40),
            
            tableView.topAnchor.constraint(equalTo: raffleNumberButton.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
            
        ])
    }
}
