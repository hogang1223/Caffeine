//
//  BottomSheetViewController.swift
//  Caffeine
//
//  Created by hyogang on 2021/08/18.
//

import UIKit
import SQLite3

class BottomSheetViewController: UIViewController {

    var db: OpaquePointer?
    var userCaffeine:[Caffeine] = []
    let model = SelectTodayModel()
    
    @IBOutlet weak var userCaffeineTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // DB Set
        model.loadData()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년 MM월 dd일"
        let currentDate = formatter.string(from: Date())
        let date = currentDate
        userCaffeine = model.selectDBSelectedDate(selectedDate: date)
        
        userCaffeineTableView.delegate = self
        userCaffeineTableView.dataSource = self
        
    } // viewDidLoad
    
    
    
   
} // BottomSheetViewController

extension BottomSheetViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userCaffeine.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "BottomSheetTableViewCell") as! BottomSheetTableViewCell
        let item = userCaffeine[indexPath.row]
        
        cell.lblItem.text = "\(item.name) (\(String(item.mg))mg)"
        cell.lblCaffeine.text = "\(String(item.mg))"
        cell.lblMemo.text = item.memo
        
        return cell
    }
    
    
} // extension

