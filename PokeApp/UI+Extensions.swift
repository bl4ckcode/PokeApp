//
//  UI+Extensions.swift
//  PokeApp
//
//  Created by Carlos Alves on 07/02/21.
//

import SwiftUI

extension Image {
    func loadImageWith(url: URL?) -> Self {
        if let url = url, let data = try? Data(contentsOf: url) {
            return Image(uiImage: UIImage(data: data)!).resizable()
        }
        return self.resizable()
    }
}
