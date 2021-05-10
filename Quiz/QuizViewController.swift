//
//  QuizViewController.swift
//  Quiz
//
//  Created by litech on 2015/02/10.
//  Copyright (c) 2015年 LifeisTech. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    
    //クイズを格納する配列
    var quizArray = [[Any]]()
    
    //正解数
    var correctAnswer: Int = 0
    
    //クイズを表示するTextView
    @IBOutlet var quizImageView: UIImageView!
    
    //選択肢のボタン
    @IBOutlet var choiceButtons1: UIButton!
    @IBOutlet var choiceButtons2: UIButton!
    @IBOutlet var choiceButtons3: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
        
        
        //------------------------ここから下にクイズを書く------------------------//
        quizArray.append([ UIImage(named:"arugininn.png"), "アスパラギン酸", "アルギニン", "トリプトファン", 2])
        quizArray.append([ UIImage(named:"asparagin.png"), "メチオニン", "アスパラギン酸", "アスパラギン", 3])
        quizArray.append([ UIImage(named:"asuparaginacid.png"), "イソロイシン", "アスパラギン酸", "チロシン", 2])
        quizArray.append([ UIImage(named:"balin.png"), "バリン", "ピロリン", "ロイシン",  1])
        quizArray.append([ UIImage(named:"chiroshin.png"), "チロシン", "トレオニン", "リシン",1])
        quizArray.append([ UIImage(named:"glutamin.png"), "リシン", "システイン", "グルタミン", 3])
        quizArray.append([ UIImage(named:"hisuchijin.png"), "メチオニン", "ヒスチジン", "アスパラギン", 2])
        quizArray.append([ UIImage(named:"isoroishin.png"), "メチオニン", "フェニルアラニン", "イソロイシン", 3])
        quizArray.append([ UIImage(named:"metionin.png"), "グリシン", "トレオニン", "メチオニン", 3])
        quizArray.append([ UIImage(named:"prorin.png"), "プロリン", "トリプトファン", "フェニルアラニン", 1])
        quizArray.append([ UIImage(named:"rishinn.png"), "リシン", "システイン", "グルタミン酸", 1])
        quizArray.append([ UIImage(named:"roishin.png"), "グルタミン酸", "ロイシン", "アスパラギン", 2])
        quizArray.append([ UIImage(named:"serin.png"), "メチオニン", "ヒスチジン", "セリン", 3])
        quizArray.append([ UIImage(named:"shisutein.png"), "システイン", "バリン", "トレオニン", 1])
        quizArray.append([ UIImage(named:"toreonin.png"), "メチオニン", "トレオニン", "イソロイシン", 2])
        quizArray.append([ UIImage(named:"toriputofan.png"), "トリプトファン", "システイン", "イソロイシン", 1])
        
        
        
        
        //------------------------ここから上にクイズを書く------------------------//

        choiceQuiz()
    }
    
    func choiceQuiz() {
        quizImageView.image = quizArray[0][0] as? UIImage
        
        //選択肢のボタンにそれぞれ選択肢のテキストをセット
        choiceButtons1.setTitle(quizArray[0][1] as? String, for: .normal)
        choiceButtons2.setTitle(quizArray[0][2] as? String, for: .normal)
        choiceButtons3.setTitle(quizArray[0][3] as? String, for: .normal)
    }
    
    @IBAction func choiceAnswer(sender: UIButton) {
        if quizArray[0][4] as! Int == sender.tag {
            //正解数を増やす
            correctAnswer+=1
        }
        
        quizArray.remove(at: 0)
        //解いた問題数の合計が予め設定していた問題数に達したら結果画面へ
        if quizArray.count == 0 {
            performSegueToResult()
        } else {
            choiceQuiz()
        }
    }
    
    func performSegueToResult() {
        performSegue(withIdentifier: "toResultView", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "toResultView") {
            
            let resultView = segue.destination as! ResultViewController
            resultView.correctAnswer = self.correctAnswer
        }
    }
}


