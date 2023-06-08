//
//  ViewController.swift
//  ToDoListOfTDD
//
//  Created by 최우태 on 2023/05/27.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var data = [Model]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    @IBAction func goInput(_ sender: UIBarButtonItem) {
        guard let inputVC = storyboard?.instantiateViewController(withIdentifier: "InputViewController") as? InputViewController else {
            return
        }
        inputVC.mainVC = self
        present(inputVC, animated: true, completion: nil)
    }

}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell", for: indexPath) as! MainTableViewCell
        cell.titleLabel.text = data[indexPath.row].title
        cell.locationLabel.text = data[indexPath.row].location
        cell.timeLabel.text = data[indexPath.row].time
        return cell
    }
    
}

