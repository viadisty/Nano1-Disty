//
//  MoistViewController.swift
//  Nano1
//
//  Created by Hardisty Aliviasari on 28/04/22.
//

import UIKit

class MoistViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var moistTableView: UITableView!
    
    var dataMoist = ["Somethinc Hydrating","Cosrx Snail"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moistTableView.register(ProductTableViewCell.nib(), forCellReuseIdentifier: ProductTableViewCell.identifier)
        moistTableView.delegate = self
        moistTableView.dataSource = self
       
        moistTableView.rowHeight = UITableView.automaticDimension
//        moistTableView.estimatedRowHeight = 60
    }
    
    @IBAction func addMoreBtn(_ sender: Any) {
        dataMoist.insert("Insert Product Name", at: dataMoist.count)
        //tableView.reloadData()
        moistTableView.insertRows(at: [IndexPath(row: dataMoist.count - 1, section: 0)], with: .automatic)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataMoist.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 126
        }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if indexPath.row > 3 {
            let moisturizerCell = tableView.dequeueReusableCell(withIdentifier: ProductTableViewCell.identifier, for: indexPath) as! ProductTableViewCell
            
//        }
        return moisturizerCell
   
   
    }
}

