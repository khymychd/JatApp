//
//  ContentViewController.swift
//  JatApp
//
//  Created by Dima Khymych on 21.01.2021.
//

import UIKit

final class ContentViewController: UIViewController{
    

    @IBOutlet weak var tableView:UITableView!

    
    private let indetifier = "Cell"
    var presenter:ContentPresenterInput?
   
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewIsReady()
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: indetifier)
        tableView.rowHeight = 60
        
        // Do any additional setup after loading the view.
    }

}

extension ContentViewController:UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.dataSource?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         
        let cell = tableView.dequeueReusableCell(withIdentifier: indetifier, for: indexPath) as! CustomTableViewCell
        let char = presenter?.dataSource?[indexPath.row].char
        let count = presenter?.dataSource?[indexPath.row].count
        cell.charLabel.text = char
        cell.countLabel.text = count
        return cell
    }
    
    
}


extension ContentViewController:ContentPresenterOutput {
    func show () {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    
}
