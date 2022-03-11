//
//  Json.swift
//  CovidNotification
//
//  Created by Emir Sürmen on 11.03.2022.
//

import Foundation

class Json {
    func parse(data: Data?) -> Dictionary<String, Any>? {
        do {
            let dataString: String = String(data: data!, encoding: .utf8)!
            
            let dict = try JSONSerialization.jsonObject(
                with: dataString.data(using: .utf8)!,
                options: []
            ) as? Dictionary<String, Any>
            
            return dict!
        } catch {
            return nil
        }
    }
}
