//
//  Water.swift
//  terra-ou-agua
//
//  Created by Hugo Santos on 03/09/20.
//  Copyright © 2020 Apple Academy UFPE. All rights reserved.
//

import Foundation

struct WaterElement: Codable {
    var query, requestId: String
    var lat, lon: Double
    var water: Bool

    enum CodingKeys: String, CodingKey {
        case query
        case requestId = "request_id"
        case lat, lon
        case water
    }
}

typealias WaterE = WaterElement
