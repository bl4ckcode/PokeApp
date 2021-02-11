//
//  PokemonViewModel.swift
//  PokeApp
//
//  Created by Carlos Alves on 07/02/21.
//

import Foundation
import Combine

class PokemonViewModel: ObservableObject {
    private let pokeapiurl = URL(string: "https://pokeapi.co/api/v2/pokemon/mewtwo")!
    
    @Published var pokemon: Pokemon = Pokemon()
    @Published var state = State.ready

        enum State {
            case ready
            case loading(Cancellable)
            case loaded
            case error(Error)
        }
    
    var getPokemonTask: AnyPublisher<Pokemon, Error> {
        URLSession.shared.dataTaskPublisher(for: pokeapiurl)
                .map { $0.data }
                .decode(type: Pokemon.self, decoder: JSONDecoder())
                .receive(on: RunLoop.main)
                .eraseToAnyPublisher()
        }
    
    func getPokemon() {
        self.state = .loading(self.getPokemonTask.sink(
            receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case let .failure(error):
                    self.state = .error(error)
                }
            },
            receiveValue: { value in
                self.state = .loaded
                self.pokemon = value
            }
        ))
    }
}
