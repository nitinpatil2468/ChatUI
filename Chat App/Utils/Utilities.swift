//
//  Utilities.swift
//  Chat App
//
//  Created by Nitin Patil on 16/01/21.
//

import Foundation
import UIKit

class Utilities{

    func getJsonString(object:Any?)-> String?{
        var json : String?
        do {
            let  jsonData = try JSONSerialization.data(withJSONObject: object as Any, options: [])
                
            if let jsonText = String(data: jsonData, encoding: .utf8){
                json = jsonText

            }
         } catch {
             print(error.localizedDescription)
         }
        return json
    }
    
    func convertToDictionary(text: String) -> [[String : String]]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [[String : String]]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
}
