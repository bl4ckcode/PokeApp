//
//  PokemonInfoView.swift
//  PokeApp
//
//  Created by Carlos Alves on 08/02/21.
//

import SwiftUI
import Combine
import UIKit

struct PokemonInfoView: View {
    let pokemon: Pokemon
    
    var body: some View {
        NavigationView {
            VStack (alignment: .leading) {
                ZStack {
                    Image("PokemonBackground")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                        .blur(radius: 2.0)
                }.overlay(DetailView(pokemon: pokemon))
            }
        }
    }
}

struct DetailView: View {
    let pokemon: Pokemon

    var body: some View {
        VStack (alignment: .leading) {
            ScrollView (.horizontal) {
                HStack(spacing: 16) {
                    ForEach(pokemon.getPokemonImagesURL()) { imageUrl in
                        PokemonImageView(pokemonName: pokemon.name!, imageUrl: imageUrl)
                    }
                }
            }
            VStack (alignment: .center) {
                Text(pokemon.name ?? "")
                    .font(.largeTitle)
                    .bold()
                Text(pokemon.getHeight() ?? "")
                    .font(.caption)
                    .bold()
                Text(pokemon.getWeight() ?? "")
                    .font(.caption)
                    .bold()
            }
        }
    }
}

struct PokemonImageView: View {
    let pokemonName: String
    let imageUrl: String

    var body: some View {
    Image(systemName: "pokemon\(pokemonName)")
        .loadImageWith(url: imageUrl.toURL())
        .resizable()
        .frame(width: 110, height: 180)
        .border(Color.gray.opacity(0.5), width: 0.5)
        .cornerRadius(8)
    }
}

struct PokemonInfo_Previews: PreviewProvider {
    @State static var pokemon = Pokemon()
    
    static var previews: some View {
        PokemonInfoView(pokemon: pokemon)
    }
}
