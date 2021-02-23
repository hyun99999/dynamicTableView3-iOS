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
    let activatedImage = UIImage(systemName: "heart.fill")?.withTintColor(#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)).withRenderingMode(.alwaysOriginal)
    
    let normalImage = UIImage(systemName: "heart")?.withTintColor(#colorLiteral(red: 0.8039215686, green: 0.8039215686, blue: 0.8039215686, alpha: 1)).withRenderingMode(.alwaysOriginal)
    
    override func awakeFromNib() {
        // nib 파일에 대한 라이프사이클
        super.awakeFromNib()
        print("MyHeartBtn - awakeFromNib() called")
        configureAction()
    }
    // 매개변수 이름을 넣지 않기위한 와일드 카드
    func setState(_ newValue: Bool){
        print("MyHeartBtn - setState() called / newValue: \(newValue)")
        
        // 현재 버튼의 상태 변경
        self.isActivated = newValue
        self.setImage(self.isActivated ? activatedImage : normalImage, for: .normal)
    }
    fileprivate func configureAction(){
            print("MyHeartBtn - configureAction() called")
        self.addTarget(self, action: #selector(onBtnClicked(_:)), for: .touchUpInside)
    }
    @objc fileprivate func onBtnClicked(_ sender:UIButton){
        print("MyHearyBtn - onBtnClicked() called")
        self.isActivated.toggle()
        animate()
    }
    
    fileprivate func animate(){
        print("MyHearBtn - animate() called")
        // 1. 클릭 되었을때 애니메이션 작동 - 스케일이 변경되면서 클릭
        UIView.animate(withDuration: 0.1, animations: {[weak self] in
            guard let self = self else { return }
            // 클로저라서 self 지정
            let newImage = self.isActivated ? self.activatedImage : self.normalImage
            self.transform = self.transform.scaledBy(x: 0.5, y: 0.5)
            self.setImage(newImage, for: .normal)
        },completion: { _ in
            // 2. 원래 스케일로 되돌리기
            UIView.animate(withDuration: 0.1, animations: {
                self.transform = CGAffineTransform.identity
            })
        })
    }
}
