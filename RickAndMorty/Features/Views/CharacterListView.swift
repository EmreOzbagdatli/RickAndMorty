//
//  CharacterListView.swift
//  RickAndMorty
//
//  Created by Emre Özbağdatlı on 17.08.2023.
//
import SwiftUI

struct CharacterListView: View {

    @ObservedObject var viewModel = CharacterViewModel()
    @State private var isAtBottom: Bool = false
    @State private var searchTerm = ""
    @Environment(\.colorScheme) var colorScheme

    var filteredCharacters: [Character] {
        if searchTerm.isEmpty {
            return viewModel.characters
        } else {
            return viewModel.characters.filter {
                $0.name.localizedCaseInsensitiveContains(searchTerm) ||
                $0.species.localizedCaseInsensitiveContains(searchTerm)
            }
        }
    }

    let columns = [
        GridItem(.adaptive(minimum: 300))
    ]

    var body: some View {
 
         
        NavigationView {
            List(filteredCharacters) { character in
                LazyVGrid(columns: columns) {
                    NavigationLink(destination: CharacterDetailView(character: character)) {
                        CharacterListCellView(character: character)
                            .onAppear {
                            if character.id == filteredCharacters.count - 1 {
                                viewModel.fetchNextCharacters()
                            }
                        }
                    }
                }
            }
                .searchable(text: $searchTerm, prompt: "Search Characters")
                .onSubmit(of: .search) {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
                .navigationTitle("Characters")
                .foregroundColor(.green.opacity(0.8))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterListView(viewModel: CharacterViewModel())
    }
}
