# wishList
테이블뷰 기반 native app 

Custom Cell을 이용한 기본적인 앱 구현 및 기능 remind

##수정 및 추가 해야할 부분 (210712)
- 가격별, 순위별 정렬 기능
- 앱 내 데이터 추가 기능
- name왜 cost의 데이터 비연결성 문제(접근)


_210707_

Array로 Cell에 들어갈 데이터 셋팅

```swift
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return costList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                 if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell {
        
            let img = UIImage(named : "\(nameList[indexPath.row]).jpg")
            cell.imgView.image = img
            cell.nameLabel.text = nameList[indexPath.row]
            cell.costLabel.text = "\(costList[indexPath.row])"
          return cell
         } else {
              return UITableViewCell()
         }
    }
```

----------------


<center><img src="https://user-images.githubusercontent.com/40759743/124763147-9b4f6380-df6e-11eb-93cb-01c53cd9b005.png"></center>

----------------

### Auto Layout 적용


![스크린샷 2021-07-07 21 28 46](https://user-images.githubusercontent.com/40759743/124760620-e1ef8e80-df6b-11eb-9ae6-6d455042e203.png)


