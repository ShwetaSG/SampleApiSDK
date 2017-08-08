//
//  ApiClass.swift
//  Phonercise
//
//  Created by Nanda Ballabh on 08/08/17.
//  Copyright © 2017 raywenderlich. All rights reserved.
//

import UIKit

open class ApiClass: NSObject {
    
 open static let sharedInstanceAPiClass = ApiClass()

    @discardableResult open func sampleRequest(_ closure:((NSError?, NSDictionary?) -> Void)? = nil) -> URLSessionDataTask {
        
        let urlString : String = "https://jsonplaceholder.typicode.com/todos/1"
        //guard let url = URL(string : urlString) else {
        //  print("Error: cannot create URL")
        //return
        //}
        let url = URL(string : urlString)
        let urlRequest = URLRequest(url : url!)
        let session = URLSession.shared
        
        let task = session.dataTask(with: urlRequest) { (data, response, error) in
            guard error == nil else {
                print(error!)
                return
            }
            guard let responseData = data else {
                print("Did not recieve data")
                return
            }
            
            do {
                guard let todo = try JSONSerialization.jsonObject(with: responseData, options: []) as? NSDictionary else {
                    print("No data found")
                    return
                }
                closure!(nil,todo)
                print("ToDo Description:", todo.description)
                
                guard let todoTitle = todo["title"] as? String else {
                    print("Could not get todo title from JSON")
                    return
                }
                print("The title is: " + todoTitle)
            }
                
            catch  {
                print("error trying to convert data to JSON")
                return
            }
        }
        task.resume()
        return task
    }
}
