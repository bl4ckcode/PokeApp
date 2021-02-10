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
        }
        .overlay(PokemonStateView(viewModel: viewModel))
        .onAppear(perform: viewModel.getPokemon)
    }
}

struct PokemonStateView: View {
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
                    Image(systemName: "pokemonditto")
                        .loadImageWith(url: viewModel.pokemon.getImageURL())
                        .resizable()
                        .hoverEffect()
                        .scaledToFit()
                        .background(Color.clear)
                    NavigationView{
                        NavigationLink(
                            destination: PokemonInfoView()) {
                                Text(viewModel.pokemon.name ?? "")
                                    .background(Color.purple)
                                    .foregroundColor(.white)
                                    .font(.title)
                                    .padding()
                            }.buttonStyle()
                    }
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
    
    func goToPokemonInfo() {
        
    }
}
