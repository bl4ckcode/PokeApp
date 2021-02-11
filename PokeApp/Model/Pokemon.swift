//
//  Pokemon.swift
//  PokeApp
//
//  Created by Carlos Alves on 07/02/21.
//

import Foundation

struct Pokemon: Codable {
    let id: Int?
    let name: String?
    let height: Int?
    let weight: Int?
    let sprites: Sprite
    
    init(id: Int? = nil,
         name: String? = nil,
         height: Int? = nil,
         weight: Int? = nil,
         sprites: Sprite = Sprite()) {
        self.id = id
        self.name = name
        self.height = height
        self.weight = weight
        self.sprites = sprites
    }
}

extension Pokemon {
    func getFrontDefaultImage() -> URL? {
        guard let frontThumbnail = sprites.front_default, !frontThumbnail.isEmpty else {
            return nil
        }
        
        return frontThumbnail.toURL()
    }
    
    func getHeight() -> String?  {
        guard let height = height else { return nil }
        return "Height: \(height)"
    }
    
    func getWeight() -> String? {
        guard let weight = weight else { return nil }
        return "Weight: \(weight)"
    }
    
    func getPokemonImagesURL() -> [String] {
        var pokemonImagesUrl: [String] = []
        
        if let back_female = sprites.back_female {
            pokemonImagesUrl.append(back_female)
        }
        
        if let back_shiny_female = sprites.back_shiny_female {
            pokemonImagesUrl.append(back_shiny_female)
        }
        
        if let back_default = sprites.back_default {
            pokemonImagesUrl.append(back_default)
        }
        
        if let front_female = sprites.front_female {
            pokemonImagesUrl.append(front_female)
        }
        
        if let front_shiny_female = sprites.front_shiny_female {
            pokemonImagesUrl.append(front_shiny_female)
        }
        
        if let back_shiny = sprites.back_shiny {
            pokemonImagesUrl.append(back_shiny)
        }
        
        if let front_default = sprites.front_default {
            pokemonImagesUrl.append(front_default)
        }
        
        if let back_default = sprites.back_default {
            pokemonImagesUrl.append(back_default)
        }


        return pokemonImagesUrl
    }
}
