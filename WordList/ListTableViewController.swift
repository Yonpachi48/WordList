//
//  ListTableViewController.swift
//  WordList
//
//  Created by Yudai Takahashi on 2021/05/04.
//

import UIKit

class ListTableViewController: UITableViewController {

    var wordArray: [Dictionary<String, String>] = []
    
    let saveDate = UserDefaults.standard

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 70
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if saveDate.array(forKey: "WORD") != nil {
            wordArray = saveDate.array(forKey: "WORD") as! [Dictionary<String, String>]
        }
        
        tableView.reloadData()
        
    }
    // MARK: - Table view data source
    
    //セクション数を指定
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    //セルの個数を指定
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wordArray.count
    }

    //セルの中身の表示の仕方を設定します
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ListTableViewCell
        
        let nowIndexPathDictionary = wordArray[indexPath.row]
        
        cell.englishLabel.text = nowIndexPathDictionary["english"]
        cell.japaneseLabel.text = nowIndexPathDictionary["japanese"]
        
        return cell
    }

}
