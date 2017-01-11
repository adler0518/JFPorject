//
//  ViewController.swift
//  JFPorject
//
//  Created by dujinfeng481 on 14-10-20.
//  Copyright (c) 2014年 djf. All rights reserved.
//

import UIKit
import JFCore

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        myObject.testSay("123");
        return;
        
        // Do any additional setup after loading the view, typically from a nib.
        var urlStr = "http://httpbin.org/get"
        urlStr = "http://www.baidu.com"
//        let URL = "http://httpbin.org/"
//        let request = JFCore.request(.GET, URL)
//        
        
        
        JFCore.request(.GET, urlStr, parameters: nil)
            .response { (request, response, data, error) in
                println("request: \(request)")
                println("response: \(response)")
                println("error: \(error)")
        }
    
//        JFCore.request(.GET, urlStr)
//            .responseString { (_, _, string, _) in
//                println("string: \(string)")
//        }
        
        println("view did load end")

//        let file = NSBundle(forClass:AppDelegate.self).pathForResource("SwiftyJSONTests", ofType: "json")
//        println(file)
//        JSON.testJsonEntry(file)
//        
//        
//        let string = "∆Test😗"
//        let s1 = string[0, 2, 3, 4]
//        let s = "hello"[0]
//        println(s1)
//        println(s!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

