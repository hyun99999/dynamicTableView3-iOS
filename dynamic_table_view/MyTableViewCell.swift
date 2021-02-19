//
//  MyTableViewCell.swift
//  dynamic_table_view
//
//  Created by Jeff Jeong on 2020/09/01.
//  Copyright © 2020 Tuentuenna. All rights reserved.
//

import Foundation
import UIKit
import SwipeCellKit

class MyTableViewCell: SwipeTableViewCell {
 
    
    @IBOutlet weak var userProfileImg: UIImageView!
    
    @IBOutlet weak var contentLabel: UILabel!
    
    // 하트 버튼(커스텀 버튼) 스토리보드에서도 수정해주어야 함.
    @IBOutlet var heartBtn: MyHeartBtn!
    
    // 따봉 버튼
    @IBOutlet var thumbsUpBtn: UIButton!
    
    @IBOutlet var shareBtn: UIButton!
    @IBOutlet var btns:[UIButton]!
    
    // 클로저 생성
    var heartBtnAction : ((Bool) -> Void)?
    
    // 피드 데이터
    var feedData: Feed? {
        didSet{
            print("MyTableViewCell - didSet / feedData: \(feedData)")
            
            if let data = feedData {
                // 피드 데이터에 따라 쎌의 UI 변경
                thumbsUpBtn.tintColor = data.isThumbsUp ? #colorLiteral(red: 0.1887893739, green: 0.3306484833, blue: 1, alpha: 1) : .systemGray
                contentLabel.text = data.content
            }
        }
    }
    
    override func awakeFromNib() {
        print("MyTableViewCell - awakeFromNib() called")
        super.awakeFromNib()
        
        userProfileImg.layer.cornerRadius = userProfileImg.frame.height / 2
    }
    
    // update
}
