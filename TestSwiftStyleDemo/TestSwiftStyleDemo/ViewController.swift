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
        let name = """
                i have noe tida  adasd asd asd asd as ,

                asd asd asadfdsfas dsfasdas ffsd fasdf sadf sadfasfasdf sdf sdfsdfsf sdfsdf sdf sd fsdf sdf sdf sdf sdfsdf sdf sdfsdf sf sd s f

                adddddd sadfad fsdf dfsd fsdf sf sdf sdf sf s fsdf sdfsdfssdf  ds fsddsf fsd sf sd
            """
        
        print(name)
        
    
        //let emptyArray = [String]()
        
        let nickName: String? = nil
        
        let fullName: String = "zhang san"
        
        let nameOne = "hi \(nickName ?? fullName)"
        
        print(nameOne)
        
        print(greet(persion: "dafsdf", day: "243"))
        print(green("asdfs", on: "adfa"))
        print(calculate(scores: [5, 23, 435, 344, 3433]))
        
        let calculateString = calculate(scores: [5, 23, 435, 344, 3433])
        print(calculateString.sum)
        print(calculateString.1)
        
        let match = hasMathes(list: [34,34535,45435,45345], condication: lessThan)
        print(match)
    }

    
    func greet(persion: String, day: String) -> String {
        return "hello \(persion), today is \(day)"
    }
    
    
    func calculate(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
        var min = scores[0]
        var max = scores[0]
        var sum = 0
        for score in scores {
            if score > max {
                max = score
            } else if score < min {
                min = score
            }
            sum += score
        }
        return (min, max, sum)
    }
    
    func returnFIfteen() -> Int {
        var y = 10
        
        func add() {
            y += 5
        }
        add()
        return y
    }
    
    
    func lessThan(number: Int) -> Bool {
         return number < 10
    }
    
    
    //参数 数组 ， 方法
    func hasMathes(list: [Int], condication: (Int) -> Bool) -> Bool {
        for item in list {
            if condication(item) {
                return true
            }
        }
        return false
    }
    
    
    //_ 无参数
    func green(_ persion: String,on day: String) -> String {
        return "hello \(persion), today is \(day)"
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
        
//        let label = "tge bane us"
//        let width = 98
//        let widthLavel = label + String(width)
//        let name = "i have \(label + width) asdfas"
        
        
        
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

