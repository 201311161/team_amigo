//
//  JSONViewController.swift
//  YourVoice
//
//  Created by 이동재 on 05/06/2019.
//  Copyright © 2019 이동재. All rights reserved.
//
import Alamofire
import UIKit

class JSONViewController: UIViewController {
    var url="http://13.209.68.216:3000/req_text"
    var namedata:String=""
    var textdata:Int=0

    
    func transmit(namedata : String, textdata: Int){
        let parameters: Parameters = [
            "name":namedata,
            "text":DataManager.shared.memoList[textdata].content!
        ]
        Alamofire.request(url, method: .post, parameters: parameters , encoding: URLEncoding.default, headers: nil).responseJSON{
            res in
            guard (res.result.value as? NSArray) != nil else {
                print("서버 호출 과정에서 에러 발생")
                return
            }
        }
        //Alamofire.download(url)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        transmit(namedata : namedata, textdata: textdata)
    }

}

            

