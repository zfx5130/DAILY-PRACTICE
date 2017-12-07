//
//  ViewController.swift
//  TestSwiftStyleDemo
//
//  Created by admin on 2017/12/6.
//  Copyright © 2017年 fuxing. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var tableView: UITableView = self.createTableView()
    
    private func createTableView() -> UITableView {
        let tableView = UITableView()
        return tableView
    }
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: FileManger
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    var subView: UIView?
    var volume: Double?
    
    var names: [String] = []
    var lookup: [String: Int] = [:]
    
    
    func function() {
        let width = 120.0
        let widthString = (width as NSNumber).stringValue
        print(widthString)
        let name = privateName()
        print(name.one)
        
        if let subView = subView, let volume = volume {
            print(subView)
            print(volume)
        }
        
        
        
        guard let subView = subView else { return }
        
        //imageView.backgroundColor = UIColor.whiteColor()
        
    }

    func privateName() -> (one: String, two: String) {
        return ("adfdds", "dsfsfsdf")
    }

    
//    func computeFFT(context: Context?, inputData: InputData?) throws -> Frequencies {
//        guard let context = context else {
//            throw FFTError.noContext
//        }
//        guard let inputData = inputData else {
//            throw FFTError.noInputData
//        }
//        return frequencies
//    }
    
   
    
    
}

