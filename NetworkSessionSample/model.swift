//
//  model.swift
//  NetworkSessionSample
//
//  Created by Saeid.mhd@gmail on 4/16/17.
//  Copyright © 2017 Saeid mohammadi. All rights reserved.
//

import Foundation

struct Weather {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

extension Weather {
    init?(json: [String: Any]) {
        guard
            let id = json["id"] as? Int,
            let main = json["main"] as? String,
            let description = json["description"] as? String,
            let icon = json["icon"] as? String
            else { return nil }
        self.id = id
        self.main = main
        self.description = description
        self.icon = icon
    }
}
