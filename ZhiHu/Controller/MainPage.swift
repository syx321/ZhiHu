//
//  ViewController.swift
//  ZhiHu
//
//  Created by 苏易肖 on 2022/1/21.
//

import UIKit
import SnapKit
import SwiftyJSON

class MainPage: BaseViewController {
    
    override func setupUI() {
        
        StoriesHandler.shared.getNewStories { success, date, result, error in
//            print(success)
//            print("\n")

            print(date!)
            print("\n")

//            if let result = result {
////                for story in result {
////                    print(story)
////                }
//                print(result)
//            }
//            print("\n")
//
//            print(error)
            
        }
        
    }
    
    func loadData() {
        
    }
    
    func updateDataSource() {
        
    }

}

//extension MainPage: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        <#code#>
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
//    
//    
//}



