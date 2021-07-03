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
    
    @IBOutlet weak var tableView2: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate =  self
        tableView2.delegate = self
        tableView2.dataSource = self
    }
    

}
//sectionとcellをわかりやすくしてみたー　7/2 16時
extension SectionsAndCellsViewController : UITableViewDataSource , UITableViewDelegate {
    //セクションの数を決める下の関数だけでできないのかな？
    func numberOfSections(in tableView: UITableView) -> Int {
        if tableView == self.tableView {
        return 2
        } else {
            return 1
        }

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
        //複数のtableViewを追加したのでifで切り替える
        if tableView == self.tableView {
        switch section {
        case 0:
            return sestion0.count
        case 1:
            return sestion1.count
        default:
            return 0
        }
        } else {
            //tableView2の時のrowの数
            return 15
        }
    }
    //センション毎にタイトルを設置する
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
           return "seciton\(section)"
       }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sestionCell")
            ?? UITableViewCell(style: .default, reuseIdentifier: "sestionCell")
        let tableView2cell = tableView2.dequeueReusableCell(withIdentifier: "tableView2cell") ?? UITableViewCell()
        //sectionが０の時にsestion0に表示する
        if tableView == self.tableView {
            switch indexPath.section {
            case 0:
                cell.textLabel?.text = sestion0[indexPath.row]
            case 1:
                cell.textLabel?.text = sestion1[indexPath.row]
            default:
                cell.textLabel?.text = "error"
            }
       
        } else {
        
            tableView2cell.textLabel?.text = "cell\(indexPath.row)"
            
        }

        //        switch section {
//        case 0:
//            cell.textLabel?.text = sestion0[indexPath.row]
//            tableView2cell.textLabel?.text = "cell\(indexPath.row)"
//        case 1:
//            cell.textLabel?.text = sestion1[indexPath.row]
//        default:
//            cell.textLabel?.text = "error"
//        }
       // tableView2cell.largeContentTitle = "a"
       
        
       //セルの名前を一緒にしたらこれはしなくてもいい
        if tableView == self.tableView {
           
            return cell
        
        } else {
            
            return tableView2cell
        }
        
    }
    
    
    

}
