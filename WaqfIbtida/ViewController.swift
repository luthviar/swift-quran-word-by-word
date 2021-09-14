//
//  ViewController.swift
//  WaqfIbtida
//
//  Created by Luthfi Abdurrahim on 14/09/21.
//

import UIKit

class ViewController: UIViewController {
    
    let arabData = AyatData.init().arabData
    let translationData = AyatData.init().translationData
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        tableView.delegate = self
        tableView.dataSource = self

    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArabicTableViewCell") as? ArabicTableViewCell else {
            
            return UITableViewCell()
        }
        
        cell.arabData = arabData
        cell.translationData = translationData
        cell.cellTableRow = indexPath.row
        cell.currentTableView = self.tableView
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arabData.count
    }        
}

