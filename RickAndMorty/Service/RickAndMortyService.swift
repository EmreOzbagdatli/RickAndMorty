//
//  CharacterService.swift
//  RickAndMorty
//
//  Created by Emre Özbağdatlı on 22.08.2023.
//

import Foundation

class RickAndMortyService {
    
    static let shared = RickAndMortyService()

    func fetchInitialCharacters(_ url: String = "https://rickandmortyapi.com/api/character", completion: @escaping ([Character]?) -> Void) {
        guard let url = URL(string: "\(url)") else {
            completion(nil)
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching data: \(error)")
                completion(nil)
                return
            }

            guard let data = data else {
                print("No data received")
                completion(nil)
                return
            }

            do {
                let decoder = JSONDecoder()
                let charactersData = try decoder.decode(CharacterListResponse.self, from: data)
                completion(charactersData.results)
            } catch {
                print("Error decoding data: \(error)")
                completion(nil)
            }
        }.resume()
    }
    
    func fetchCharacters(_ index: Int, completion: @escaping ([Character]?) -> Void) {
        
        guard let url = URL(string: "\("https://rickandmortyapi.com/api/character/?page=\(index)")") else {
            completion(nil)
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching data: \(error)")
                completion(nil)
                return
            }

            guard let data = data else {
                print("No data received")
                completion(nil)
                return
            }

            do {
                let decoder = JSONDecoder()
                let charactersData = try decoder.decode(CharacterListResponse.self, from: data)
                completion(charactersData.results)
            } catch {
                print("Error decoding data: \(error)")
                completion(nil)
            }
        }.resume()
    }
    
    
}

