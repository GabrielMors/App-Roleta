//
//  ViewController.swift
//  Roleta
//
//  Created by Gabriel Mors  on 11/06/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    var screen: HomeScreen?
    var listPerson: [Person] = []
    var listImage: [String] = ["Image-1", "Image-2", "Image-3", "Image-4", "Image-5"]
    var person: Person?
    lazy var alert: AlertController = {
        let alert = AlertController(controller: self)
        return alert
    }()
    
    override func loadView() {
        screen = HomeScreen()
        view = screen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        screen?.configTableView(delegate: self, dataSource: self)
        screen?.textFieldDelegate(delegate: self)
        screen?.delegate(delegate: self)
        blockedDrawNumberButton()
    }
    
    private func blockedDrawNumberButton() {
        if listPerson.isEmpty {
            screen?.raffleNumberButton.isEnabled = false
            screen?.raffleNumberButton.alpha = 0.5
        } else {
            screen?.raffleNumberButton.isEnabled = true
            screen?.raffleNumberButton.alpha = 1
        }
    }
}

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let person = person, listPerson[indexPath.row] === person {
            alert.showAlert(title: "Muitoo bom", message: "Agora é sua vez \(person.name), pague a conta 🤪")
            listPerson.removeAll()
        } else {
            alert.showAlert(title: "Uffa", message: "você escapou dessa vez 🥳")
            listPerson.remove(at: indexPath.row)
        }
        blockedDrawNumberButton()
        screen?.tableView.reloadData()
    }
}

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if listPerson.count == 0 {
            return 1
        } else {
            return listPerson.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if listPerson.count == 0 {
            let cell = screen?.tableView.dequeueReusableCell(withIdentifier: EmptyTableViewCell.identifier) as? EmptyTableViewCell
            return cell ?? UITableViewCell()
        } else {
            let cell = screen?.tableView.dequeueReusableCell(withIdentifier: PersonTableViewCell.identifier, for: indexPath) as? PersonTableViewCell
            cell?.setupCell(data: listPerson[indexPath.row])
            return cell ?? UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if listPerson.count == 0 {
            return 237
        } else {
            return 92
        }
    }
}

extension HomeViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if !(textField.text?.isEmpty ?? false) {
            listPerson.append(Person(name: textField.text ?? "", image: listImage.randomElement() ?? ""))
            screen?.tableView.reloadData()
            blockedDrawNumberButton()
        }
        textField.text = ""
        return true
    }
}

extension HomeViewController: HomeScreenProtocol {
    
    func tappedRaffleNumberButton() {
        person = listPerson.randomElement()
    }
}
