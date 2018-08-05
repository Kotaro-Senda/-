//
//  ViewController.swift
//  クイズ
//
//  Created by Senda Kotaro on 2018/08/05.
//  Copyright © 2018年 xyz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    var currentQuestionNumber: Int = 0
    let questions:[[String:Any]] = [
        [
            "q":"iphoneアプリを開発する総合環境はZcodeである",
            "a":false
        ],
        [
            "q":"xcode画面の右端にはutilitysがある",
            "a":true
        
        ],
        [
            "q":"UILabelは文字列表示に使う",
            "a":true
        ]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showQuestion()
    }

    
    @IBAction func tapppedNoButton(_ sender: UIButton) {
        checkAnswer(yourAnswer: false)
        print("false")
    }
    
    @IBAction func tapppedYesButton(_ sender: UIButton) {
        checkAnswer(yourAnswer: true)
        print("true")
    }
    
    func showQuestion() {
        let question = questions[currentQuestionNumber]
        //型を明示
        if let questionText = question["q"] as? String{
            questionLabel.text = questionText
        }
    }
    
    func checkAnswer(yourAnswer: Bool) {
        let question = questions[currentQuestionNumber]
        
        if let ans = question["a"] as? Bool{
            
            if yourAnswer == ans {
                //正解
                
                showAlert(message: "正解🙆‍♀️")
                
                
    
            }else{
                
               
                }
                showAlert(message: "不正解🙅‍♀️")
        
            }
            currentQuestionNumber += 1
        }
        
        if currentQuestionNumber > question.count {
            currentQuestionNumber = 0
            
           
        }
        
        showQuestion()
    }
    func showAlert(message:String) {
        let alert = UIAlertController(title: nil,
                                      message: message, preferredStyle: .alert)
        let close = UIAlertAction(title:"閉じる",style: .cancel, handler:nil)
        alert.addAction(close)
        present(alert,animated:  true, completion: nil)
    
        }

    }
        
    



