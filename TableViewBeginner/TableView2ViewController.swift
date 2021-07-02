//
//  TableView2ViewController.swift
//  TableViewBeginner
//
//  Created by IwasakIYuta on 2021/07/02.
//

import UIKit

class TableView2ViewController : UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
  

}
extension TableView2ViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20 //rowの数（セルの数）
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //標準で設定されてるレイアウトを使ってみた
        var cellid = ""
        switch indexPath.row {
        case 0:
            cellid = "cell1"
        case 1:
            cellid = "cell2"
        case 2:
            cellid = "cell3"
        case 3:
            cellid = "cell4"
        default://switchは全部網羅しないとエラーが出るのでindexPath.rowが４以上の時はカスタムセルが出るように設定
            cellid = "cell5"
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: cellid) ?? UITableViewCell()
       //dequeueReusableCellセルは利用可能なセルで一番上のセルが消えた時にキューの中に入ってまた使えるようにする？
        cell.textLabel?.text = "text1"
        cell.detailTextLabel?.text = "text2"
        return cell
    }
    
    
    
}
