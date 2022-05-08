//
//  DetailsViewController.swift
//  Nano1
//
//  Created by Hardisty Aliviasari on 26/04/22.
//

import UIKit

class DetailsViewController: UIViewController, ModallyViewControllerDelegate {
    
    @IBOutlet weak var serumTableView: UITableView!
    
    
    
    var dataSerum = ["Somethinc Hydrating Serum","Cosrx Snail Serum"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        serumTableView.register(ProductTableViewCell.nib(), forCellReuseIdentifier: ProductTableViewCell.identifier)
        
        serumTableView.delegate = self
        serumTableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    // MARK: - Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "faceSerumToDetails" {
            let modal = segue.destination as? ModallyViewController
            // since we already subscribe the delegate from second page, we need to connect it to here
            
            modal?.delegate = self
        }
    }
    func addNewData(data: String){
        dataSerum.append(data)
        serumTableView.reloadData()
    }
    
    //    @IBAction func addListBtn(_ sender: Any) {
    //        dataSerum.insert("Insert Product Name", at: dataSerum.count)
    //        //tableView.reloadData()
    //        serumTableView.insertRows(at: [IndexPath(row: dataSerum.count - 1, section: 0)], with: .automatic)
    //    }
    
}
//extension serum
extension DetailsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("ok pencet")
    }
    
}
extension DetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSerum.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath)
        cell.textLabel?.text = dataSerum[indexPath.row]
        return cell
    }
}

