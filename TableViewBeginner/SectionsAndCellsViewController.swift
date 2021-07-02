//
//  SectionsAndCellsViewController.swift
//  TableViewBeginner
//
//  Created by IwasakIYuta on 2021/07/02.
//

import UIKit

class SectionsAndCellsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var sestion0 = ["a","b","c"]
    var sestion1 = ["あ","い","う"]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate =  self
    }
    

}
//sectionとcellをわかりやすくしてみたー　7/2 16時
extension SectionsAndCellsViewController : UITableViewDataSource , UITableViewDelegate {
    //セクションの数を決める下の関数だけでできないのかな？
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //下は ifでやってるけどsectionの数が多くなったらSwitchでやった方がいいだろう多分
//        if section == 0 {
//            return sestion0.count
//        } else if section == 1 {
//            return sestion1.count
//        } else {
//            return 0
//        }
        switch section {
        case 0:
            return sestion0.count
        case 1:
            return sestion1.count
        default:
            return 0
        }
    }
    //センション毎にタイトルを設置する
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
           return "seciton\(section)"
       }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sestionCell")
            ?? UITableViewCell(style: .default, reuseIdentifier: "sestionCell")
        //sectionが０の時にsestion0に表示する
        if indexPath.section == 0 {
        cell.textLabel?.text = sestion0[indexPath.row]
        } else {
        cell.textLabel?.text = sestion1[indexPath.row]
        }
        return cell
    }
    
    

}
