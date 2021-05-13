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
    var nowNumber: Int = 0  //現在の回答数
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
    
    @IBAction func nextButtonTapped() {
        //回答したか
        if isAnswered {
            //次の問題へ
            nowNumber += 1
            answerLabel.text = ""
            
            //次の問題を表示するか
            if nowNumber < wordArray.count{
                //次の問題を表示
                questionLabel.text = wordArray[nowNumber]["english"]
                //isAnsweredをfalseにする
                isAnswered = false
                //ボタンのタイトルを変更
                nextButton.setTitle("答えを表示", for: .normal)
            } else {
                nowNumber = 0
                performSegue(withIdentifier: "toFinishView", sender: nil)
            }
        } else {
            //答えを表示
            answerLabel.text = wordArray[nowNumber]["japanese"]
            //isAnsweredをTrueに
            isAnswered = true
            //ボタンのタイトルを変更
            nextButton.setTitle("次へ", for: .normal)
        }
    }
}


