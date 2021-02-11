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
            ZStack(alignment: .leading) {
                ZStack(alignment: .center) {
                    Image("PokemonBackground")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                        .blur(radius: 2.0)
                }
                VStack (alignment: .center) {
                    PokemonImageScrollView(pokemon: pokemon)
                        .frame(maxHeight: 200)
                    Text(pokemon.name ?? "")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.red)
                    Text(pokemon.getHeight() ?? "")
                        .font(.caption)
                        .bold()
                    Text(pokemon.getWeight() ?? "s")
                        .font(.caption)
                        .bold()
                    Spacer().frame(maxWidth: .infinity)
                }
                .frame(maxHeight: .infinity)
                .padding()
            }
            
        }
    }
}

struct PokemonImageScrollView: View {
    let pokemon: Pokemon
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView (.horizontal) {
                HStack(spacing: 16) {
                    ForEach(pokemon.getPokemonImagesURL()) { imageUrl in
                        PokemonImageView(pokemonName: pokemon.name!, imageUrl: imageUrl)
                    }
                }
                .padding()
                .frame(width: geometry.size.width)
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
        .scaledToFit()
        .border(Color.green.opacity(0.5), width: 0.5)
        .cornerRadius(8)
    }
}

struct PokemonInfo_Previews: PreviewProvider {
    @State static var pokemon = Pokemon()
    
    static var previews: some View {
        PokemonInfoView(pokemon: pokemon)
    }
}
