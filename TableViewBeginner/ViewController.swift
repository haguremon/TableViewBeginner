//
//  ViewController.swift
//  TableViewBeginner
//
//  Created by IwasakIYuta on 2021/07/02.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var cellSample = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","r","s","t","u","v","w","x","y","z"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
    }


}
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellSample.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //セルをある条件で切り替える↓
     var identity = ""
        //配列の順番で偶数と奇数で切り替える
        if indexPath.row % 2 == 0 {
            identity = "Cell1"
        } else {
            identity = "Cell2"
        }
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identity) ?? UITableViewCell(style: .default, reuseIdentifier: identity)
        cell.textLabel?.text = cellSample[indexPath.row]
        return cell
    }
    @IBAction func exit(segue: UIStoryboardSegue){}
    
    
}

