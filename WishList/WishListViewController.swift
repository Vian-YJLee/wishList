//
//  WishListViewController.swift
//  WishList
//
//  Created by LeeYongJin on 2021/07/04.
//

import UIKit

class WishListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MVVM 리팩토링
    // Model
    //  - nameList와 costList의 Data 상호 연결성 확보 필요
    //  > New) Struct WishItemInfo
    
    // View
    //  - ListCell (imgView, nameLabel, costLabel)
    //  > View들은 ViewModel을 통해서 구성됨
    //  > 클래스에 필요한 data를 ViewModel로 부터 받아 View Update진행
    
    // ViewModel
    //  - New) DetailViewModel
    //  > View Layer에서 필요한 Method 작성
    //  > Model 포함 할 것 (wishItemInfo)
    
    let nameList = ["PS5", "Zero Dawn", "Forbidden", "Miles", "LOU2"]
    let costList = [680000, 28000, 69000, 32000, 89000]
    
    // DetailViewController에 데이터 전달
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let ViewCtrl = segue.destination as? DetailViewController
            if let index = sender as? Int {
                ViewCtrl?.name = nameList[index]
                ViewCtrl?.cost = costList[index]
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
//    //viewController 초기화면 돌아오기
//    @IBAction func unwindMain (segue : UIStoryboardSegue) {
//
//    }
    
    //UITableViewDataSource
    //TableView cell 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return costList.count
        //array 개수 세기
    }
    // TableView 표시형태(재사용시)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //setting된 값을 ListCell를 통해 표현해야 하기때문에 옵셔널로 캐스팅
        //guard - else 로 옵셔널 바인딩 방식 변경
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell else {
            return UITableViewCell()
        }
        let img = UIImage(named: "\(nameList[indexPath.row]).jpg")
        cell.imgView.image = img
        cell.nameLabel.text = nameList[indexPath.row]
        cell.costLabel.text = "\(costList[indexPath.row])"
        
        return cell
    }
    
    //UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //cell 터치시 console message 확인
        print("Index : \(indexPath.row)")
        performSegue(withIdentifier: "showDetail", sender: indexPath.row)
        }
//러닝결과 터치가 왜 한 템포씩 느릴까..? <- didDeselectRowAt으로 되어있었음. 해결
}

class ListCell: UITableViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var costLabel: UILabel!
}

struct WishItemInfo {
    let name: String
    let cost: Int
    
    var img: UIImage? {
        return UIImage(named: "\(name).jpg")
    }
    
    init(name: String, cost: Int) {
        self.name = name
        self.cost = cost
    }
}
