//
//  QuestionViewController.swift
//  WordList
//
//  Created by Yudai Takahashi on 2021/05/03.
//

import UIKit

class QuestionViewController: UIViewController {

    @IBOutlet var answerLabel: UILabel!
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var nextButton: UIButton!
    
    var isAnswered: Bool = false   //回答したか・次の質問へ行くかの判断
    var wordArray: [Dictionary<String,String>] = [] //UserDefaultsからとる配列
    var nowNumber: Int = 0
    let saveDate = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        answerLabel.text = ""
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        wordArray = saveDate.array(forKey: "WORD") as! [Dictionary<String, String>]
        //問題をシャッフル
        wordArray.shuffle()
        questionLabel.text = wordArray[nowNumber]["english"]
    }
}
