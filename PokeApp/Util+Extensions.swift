//
//  Util+Extensions.swift
//  PokeApp
//
//  Created by Carlos Alves on 11/02/21.
//

import Foundation

extension String: Identifiable {
    public var id: String { self }
}

extension String {
    func toURL() -> URL {
        return URL(string: self)!
    }
}
