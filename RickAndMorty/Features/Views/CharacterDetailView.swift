//
//  MainViewController.swift
//  RickAndMorty
//
//  Created by Emre Özbağdatlı on 17.08.2023.
//

import SwiftUI
import Kingfisher

struct CharacterDetailView: View {
    let character: Character
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack {
            
            VStack {
                KFImage(URL(string: character.image))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                    )
                    .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 5)
                Text(character.name)
                    .foregroundColor(colorScheme == .dark ? .blue : .black)
                    .font(.largeTitle)
                    .padding(.top)
                    .bold()
                VStack(alignment: .leading) {
                    
                    HStack(spacing: 1) {
                        Text("Species:")
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                            .font(.title2)
                            .bold()
                        Text(character.species)
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                            .font(.title2)
                    }.padding(.leading)
                    HStack(spacing: 1) {
                        Text("Gender:")
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                            .font(.title2)
                            .bold()
                        Text(character.gender.rawValue)
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                            .font(.title2)
                    }.padding()
                    HStack(spacing: 1) {
                        Text("Status:")
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                            .font(.title2)
                            .bold()
                        Text(character.status.rawValue)
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                            .font(.title2)
                    }.padding()
                    HStack(spacing: 1) {
                        Text("Location:")
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                            .font(.title2)
                            .bold()
                        Text(character.location.name)
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                            .font(.title2)
                    }.padding()
                    
                    
                }.padding(.top)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding()
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Character Detail")
            Spacer()
        }
    }
    
}
struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailView(character: Character(location: .init(name: "Earth"), id: 1, name: "Rick Sanchez", species: "Human", image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", gender: .Female, status: .Dead, type: "Rick's Toxic Side"))
    }
}
