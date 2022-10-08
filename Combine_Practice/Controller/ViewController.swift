//
//  ViewController.swift
//  Combine_Practice
//
//  Created by Ripon sk on 08/10/22.
//

import UIKit
import Combine
class ViewController: UIViewController {
    var observer:AnyCancellable?
    @IBOutlet weak var tableviews: UITableView!
    var arr = [String]()
    var shareds = DataFetch.shared.fetchdata()
    override func viewDidLoad() {
        super.viewDidLoad()
        observer = shareds.receive(on: DispatchQueue.main).sink(receiveCompletion: { comp in
            print("error is:\(comp)")
        }, receiveValue: { val in
            self.arr = val
            self.tableviews.reloadData()
        })
        // Do any additional setup after loading the view.
    }


}

extension ViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = arr[indexPath.row]
        return cell
    }
    
    
}
