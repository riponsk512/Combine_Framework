//
//  DataFetch.swift
//  Combine_Practice
//
//  Created by Ripon sk on 08/10/22.
//

import Foundation
import Combine
class DataFetch{
    public static var shared = DataFetch()
    func fetchdata() -> Future<[String],Error>{
        return Future{
            promis in
            promis(.success(["Apple","Banana","Mango"]))
        }
    }
    
}
