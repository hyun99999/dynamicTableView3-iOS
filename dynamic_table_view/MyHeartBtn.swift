//
//  MyHeartButton.swift
//  dynamic_table_view
//
//  Created by kimhyungyu on 2021/02/17.
//  Copyright © 2021 Tuentuenna. All rights reserved.
//

import Foundation
import UIKit
class MyHeartBtn: UIButton {
    
    var isActivated : Bool = false
    
    override class func awakeFromNib() {
        // nib 파일에 대한 라이프사이클
        super.awakeFromNib()
        print("MyHeartBtn - awakeFromNib() called")
    }
    // 매개변수 이름을 넣지 않기위한 와일드 카드
    func setState(_ newValue: Bool){
        print("MyHeartBtn - setState() called / newValue: \(newValue)")
        
        // 1. 현재 버튼의 상태 변경
        self.isActivated = newValue
        // 2. 변경된 상태에 따른 이미지 변경
        let activatedImage = UIImage(systemName: "heart.fill")?.withTintColor(#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)).withRenderingMode(.alwaysOriginal)
        
        let normalImage = UIImage(systemName: "heart")?.withTintColor(.systemGray2).withRenderingMode(.alwaysOriginal)
        self.setImage(self.isActivated ? activatedImage : normalImage, for: .normal)
    }
}
