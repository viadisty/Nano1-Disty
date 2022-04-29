//
//  ViewController.swift
//  ProjectNano1
//
//  Created by Hardisty Aliviasari on 28/04/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let serumCell = tableView.dequeueReusableCell(withIdentifier: "serumCell", for: indexPath)
        serumCell.textLabel?.text = "hello world"
        return serumCell
    }

}

