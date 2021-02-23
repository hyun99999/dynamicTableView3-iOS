# dynamicTableView3-iOS
기존의 dynamicTableView 를 이용해서 custom toggle button 을 활용한 튜토리얼
- 클릭 시 아이콘의 스케일을 줄이고 다시 원래 스케일로 되돌림으로써 버튼이 클릭되는 애니매이션을 커스텀 해보았다.
```swift
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
```

### 완성
<img src = "https://user-images.githubusercontent.com/69136340/108823348-a3cc8080-7603-11eb-8e10-eb92fbffeafd.png" width ="250">

### 출처
출처ㅣ https://www.youtube.com/watch?v=nC-MQEvLAP4&t=773s
