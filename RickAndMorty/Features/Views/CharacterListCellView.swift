//
//  DetailViewController.swift
//  RickAndMorty
//
//  Created by Emre Özbağdatlı on 17.08.2023.
//


import SwiftUI
import Kingfisher

struct CharacterListCellView: View {
    let character: Character
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        HStack() {
            KFImage(URL(string: character.image))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .frame(width: 100, height: 100)
                .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray.opacity(0.5), lineWidth: 1)
            )
                .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 5)
                .padding(.trailing)
        }

        VStack(alignment: .leading) {
            Text(character.name)
                .foregroundColor(colorScheme == .dark ? .blue : .black)
                .font(.title3)
            Text(character.species)
                .foregroundColor(colorScheme == .dark ? .white : .green)
                .font(.subheadline)
                .bold()
        }
        Spacer()
    }
}


struct CharacterListView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterListCellView(character: Character(location: .init(name: "Earth"), id: 1, name: "Rick Sanchez", species: "Human", image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", gender: .Female, status: .Alive, type: "emsi"))
            .previewLayout(.fixed(width: 300, height: 80))
    }
}
    
