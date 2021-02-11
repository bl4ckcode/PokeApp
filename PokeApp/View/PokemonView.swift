//
//  ContentView.swift
//  PokeApp
//
//  Created by Carlos Alves on 07/02/21.
//

import SwiftUI
import Combine
import UIKit

struct PokemonView: View {
    @ObservedObject var viewModel = PokemonViewModel()

    var body: some View {
        NavigationView {
            ZStack {
                Image("Background")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .blur(radius: 5.0)
            }
            .overlay(PokemonStateView(viewModel: viewModel))
        }
        .onAppear(perform: viewModel.getPokemon)
    }
}

struct PokemonStateView: View {
    let screenWidth = UIScreen.main.bounds.size.width
    let screenHeight = UIScreen.main.bounds.size.height
    
    @ObservedObject var viewModel = PokemonViewModel()
    
    var body: some View {
        switch viewModel.state {
        case .ready:
            return AnyView(EmptyView())
        case .loading(_):
            return AnyView(ProgressView())
        case .loaded:
            return AnyView(
                VStack (alignment: .center) {
                    Text("Who is this pokemon?")
                        .font(.largeTitle)
                        .bold()
                    Image(systemName: "pokemon\(viewModel.pokemon.name!)")
                        .loadImageWith(url: viewModel.pokemon.getFrontDefaultImage())
                        .renderingMode(.template)
                        .foregroundColor(Color.black)
                        .scaledToFit()
                        .frame(width: screenWidth, height: screenHeight/3)
                        .hoverEffect()
                        .background(Color.clear)
                        .padding()
                    NavigationLink (destination: PokemonInfoView(pokemon: viewModel.pokemon)) {
                            Image("Pokeball")
                                .scaledToFit()
                                .scaleEffect()
                        }.buttonStyle(PlainButtonStyle())
                    }
            )
        case .error(let error):
            return AnyView(
                VStack(spacing: 10) {
                    Text(error.localizedDescription)
                        .frame(maxWidth: 300)
                    Button("Retry") {
                        viewModel.getPokemon()
                    }
                }
                .padding()
                .background(Color.yellow)
            )
        }
    }
}

struct PokemonView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonView()
    }
}
