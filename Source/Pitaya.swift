//
//  Pitaya.swift
//  Pitaya
//
//  Created by JohnLui on 15/5/14.
//  Copyright (c) 2015年 http://lvwenhan.com. All rights reserved.
//

import Foundation

public class Pitaya {
    
    public static var DEBUG = false
    
    var method: HTTPMethod!
    var url: String!
    var params: [String: AnyObject]?
    var files: [File]?
    var errorCallback: ((error: NSError) -> Void)?
    var callback: ((data: NSData?, response: NSHTTPURLResponse?) -> Void)?
    
    public func addParams(params: [String: AnyObject]?) -> Pitaya {
        self.params = params
        return self
    }
    public func addFiles(files: [File]?) -> Pitaya {
        self.files = files
        return self
    }
    public func response(callback: ((data: NSData?, response: NSHTTPURLResponse?) -> Void)?) {
        let pm = PitayaManager(url: self.url, method: self.method, params: self.params!, files: self.files!, errorCallback: self.errorCallback, callback: callback)
        pm.fire()
    }
    
    public static func request(HTTPMethod method: HTTPMethod, url: String) -> Pitaya {
        let p = Pitaya()
        p.method = method
        p.url = url
        return p
    }
    
    public static func request(method: HTTPMethod, url: String, errorCallback: ((error: NSError) -> Void)?, callback: ((data: NSData?, response: NSHTTPURLResponse?) -> Void)?) {
        let pitaya = PitayaManager(url: url, method: method, errorCallback: errorCallback, callback: callback)
        pitaya.fire()
    }
    public static func request(method: HTTPMethod, url: String, params: Dictionary<String, AnyObject>, errorCallback: ((error: NSError) -> Void)?, callback: ((data: NSData?, response: NSHTTPURLResponse?) -> Void)? ) {
        let pitaya = PitayaManager(url: url, method: method, params: params, errorCallback: errorCallback, callback: callback)
        pitaya.fire()
    }
    public static func request(method: HTTPMethod, url: String, files: Array<File>, errorCallback: ((error: NSError) -> Void)?, callback: ((data: NSData?, response: NSHTTPURLResponse?) -> Void)?) {
        let pitaya = PitayaManager(url: url, method: method, files: files, errorCallback: errorCallback, callback: callback)
        pitaya.fire()
    }
    public static func request(method: HTTPMethod, url: String, params: Dictionary<String, AnyObject>, files: Array<File>, errorCallback: ((error: NSError) -> Void)?, callback:((data: NSData?, response: NSHTTPURLResponse?) -> Void)? ) {
        let pitaya = PitayaManager(url: url, method: method, params: params, files: files, errorCallback: errorCallback, callback: callback)
        pitaya.fire()
    }
}
