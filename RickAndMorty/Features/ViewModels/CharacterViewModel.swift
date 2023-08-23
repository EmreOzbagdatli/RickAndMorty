//
//  CharacterViewModel.swift
//  RickAndMorty
//
//  Created by Emre Özbağdatlı on 22.08.2023.
//

import Foundation


class CharacterViewModel: ObservableObject {

    @Published var characters: [Character] = []
    @Published var currentIndex: Int = 1

    init() {
        fetchCharacters()
    }

    func fetchCharacters() {
        RickAndMortyService.shared.fetchInitialCharacters(completion: { characters in
            if let characters = characters {
                DispatchQueue.main.async { [weak self] in
                    self?.characters = characters
                }
            }
        })
    }

    func fetchNextCharacters() {
        currentIndex += 1

        RickAndMortyService.shared.fetchCharacters(currentIndex) { characters in
            if let characters = characters {
                DispatchQueue.main.async { [weak self] in
                    self?.characters.append(contentsOf: characters)
                }
            }
        }
    }
}



