//
//  Sprite.swift
//  PokeApp
//
//  Created by Carlos Alves on 07/02/21.
//

import Foundation

struct Sprite: Codable {
    let back_female: String?
    let back_shiny_female: String?
    let front_female: String?
    let front_shiny_female: String?
    let back_shiny: String?
    let front_default: String?
    let back_default: String?
    let front_shiny: String?
    
    init(back_female: String? = nil, back_shiny_female: String? = nil,
         front_female: String? = nil, front_shiny_female: String? = nil,
         back_shiny: String? = nil, front_shiny: String? = nil, front_default: String? = nil,
         back_default: String? = nil) {
        self.back_female = back_female
        self.back_shiny_female = back_shiny_female
        self.front_female = front_female
        self.front_shiny_female = front_shiny_female
        self.back_shiny = back_shiny
        self.front_shiny = front_shiny
        self.front_default = front_default
        self.back_default = back_default
    }
}
