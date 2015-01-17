//
//  ViewController.swift
//  Storing images locally
//
//  Created by Talha Qamar on 1/17/15.
//  Copyright (c) 2015 Talha Qamar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var bach: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        var url = NSURL(string : "http://freedwallpaper.com/wp-content/uploads/2014/09/Tattoo-Girl.jpg")
        
        let urlrequest = NSURLRequest(URL: url!)
        NSURLConnection.sendAsynchronousRequest(urlrequest, queue: NSOperationQueue.mainQueue(), completionHandler: {
            response ,data , error in
            
            if error != nil
            {
                println("error occurs")
            }
            else
            {
                let image = UIImage(data: data)
               // self.bach.image = image
                
                /* Storing image locally */
            
                var documentsDirectory:String?
                var paths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
                println(paths)
                if paths.count > 0{
                    documentsDirectory = paths[0] as? String
                    var savePath = documentsDirectory! + "/bach.jpg"
                    NSFileManager.defaultManager().createFileAtPath(savePath, contents: data, attributes: nil)
                    self.bach.image  = UIImage(named: savePath)
                }
            }
            
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

