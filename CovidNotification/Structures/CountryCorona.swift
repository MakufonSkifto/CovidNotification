//
//  Country.swift
//  CovidNotification
//
//  Created by Emir Sürmen on 11.03.2022.
//

import Foundation

struct CountryCorona {
    let name: String
    let population: Int
    let lastUpdated: Int
    let countryInfo: Dictionary<String, Any>
    let cases: Int
    let todayCases: Int
    let deaths: Int
    let todayDeaths: Int
    let recovered: Int
    let todayRecovered: Int
    let activeCases: Int
    let criticalCases: Int

    static func fromJson(data: Dictionary<String, Any>) -> CountryCorona {
        return CountryCorona(
            name: data["country"] as! String,
            population: data["population"] as! Int,
            lastUpdated: data["updated"] as! Int,
            countryInfo: data["countryInfo"] as! Dictionary<String, Any>,
            cases: data["cases"] as! Int,
            todayCases: data["todayCases"] as! Int,
            deaths: data["deaths"] as! Int,
            todayDeaths: data["todayDeaths"] as! Int,
            recovered: data["recovered"] as! Int,
            todayRecovered: data["todayRecovered"] as! Int,
            activeCases: data["active"] as! Int,
            criticalCases: data["critical"] as! Int
        )
    }
}
