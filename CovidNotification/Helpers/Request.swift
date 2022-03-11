//
//  Request.swift
//  CovidNotification
//
//  Created by Emir Sürmen on 11.03.2022.
//

import Foundation

class Request {
    func getCountryCoronaInfo(countryCode: String, completion: @escaping (Result<CountryCorona, Error>) -> Void) {
        let url = URL(
            string: String(format: "https://disease.sh/v2/countries/\(countryCode)")
        )!
        print(countryCode)
        
        let request = URLRequest(url: url)
        let session = URLSession.shared
        let json = Json()
        
        session.dataTask(with: request) {(response, data, error) in
            let dict = json.parse(data: response)
            
            let country = CountryCorona.fromJson(data: dict!)
            completion(.success(country))
        }.resume()
    }
}
