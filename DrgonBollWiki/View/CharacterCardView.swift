//
//  BasicCharacterCardView.swift
//  DrgonBollWiki
//
//  Created by Jacob Aguilar on 13-03-24.
//

import SwiftUI

struct CharacterCardView: View {
    let character: Character
    
    @State private var characterKiColor: Color = .yellow
    @State private var characterRace = Race.saiyan
    
    init(character: Character) {
        self.character = character
    }
    
    //Razas:
    //["Evil", "Android", "Majin", "Nucleico", "Namekian", "Saiyan", "Jiren Race", "Frieza Race", "Nucleico benigno", "Human", "Angel", "God", "Unknown"]
    enum Race: String {
        case evil = "Evil", android = "Android", majin = "Majin", nucleico = "Nucleico", namekian = "Namekian", saiyan = "Saiyan", jirenRace = "Jiren Race", friezaRace = "Frieza Race", nucleicoBenigno = "Nucleico benigno", human = "Human", angel = "Angel", god = "God", unknown = "Unknown"
    }
    
    var body: some View {
        ZStack {
            ZStack {
                RoundedRectangle(cornerRadius: 30)
                    .fill(Color.black.gradient)
                    .blur(radius: 1)
                    .opacity(0.8)
                
                RoundedRectangle(cornerRadius: 30)
                    .fill(.ultraThinMaterial)
                    .blur(radius: 1)
                    .opacity(0.8)
            }
            
            AsyncImage(url: URL(string: character.image)) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .shadow(color: characterKiColor , radius: 5, x: 0, y: 0 )
            } placeholder: {
                ProgressView()
            }
            .padding(40)
            
            VStack {
                HStack {
                    Text(character.ki)
                        .font(.title2)
                        .fontWeight(.bold)
                        
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "star")
                            .font(.title2)
                            .foregroundStyle(.gray)
                    }

                }
                
                Spacer()
                
                Text(character.name)
                    .font(.custom("SaiyanSans", size: 42))
                    .foregroundStyle(Color.yellow)
                    .shadow(color: .black, radius: 0, x: 1, y: 1)
                    .shadow(color: .white, radius: 0, x: -1, y: -1)
//                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding()
        }
        .frame(height: 400)
        .task {
            switch character.race {
            case "Evil":
                characterKiColor = .black
            case "Android":
                characterKiColor = .cyan
            case "Majin":
                characterKiColor = .pink
            case "Nucleico":
                characterKiColor = .white
            case "Namekian":
                characterKiColor = .green
            case "Saiyan":
                characterKiColor = .yellow
            case "Jiren Race":
                characterKiColor = .red
            case "Frieza Race":
                characterKiColor = .gray
            case "Nucleico benigno":
                characterKiColor = .brown
            case "Human":
                characterKiColor = .blue
            case "Angel":
                characterKiColor = .mint
            case "God":
                characterKiColor = .indigo
            case "Unknown":
                characterKiColor = .white
            default:
                characterKiColor = .white
            }
        }
    }
}

#Preview {
    let character = Character(id: 1, name: "Goku", ki: "60.000.000", maxKi: "90 Septillion", race: "Evil", gender: "Male", description: "El protagonista de la serie, conocido por su gran poder y personalidad amigable. Originalmente enviado a la Tierra como un infante volador con la misión de conquistarla. Sin embargo, el caer por un barranco le proporcionó un brutal golpe que si bien casi lo mata, este alteró su memoria y anuló todos los instintos violentos de su especie, lo que lo hizo crecer con un corazón puro y bondadoso, pero conservando todos los poderes de su raza. No obstante, en la nueva continuidad de Dragon Ball se establece que él fue enviado por sus padres a la Tierra con el objetivo de sobrevivir a toda costa a la destrucción de su planeta por parte de Freeza. Más tarde, Kakarot, ahora conocido como Son Goku, se convertiría en el príncipe consorte del monte Fry-pan y líder de los Guerreros Z, así como el mayor defensor de la Tierra y del Universo 7, logrando mantenerlos a salvo de la destrucción en innumerables ocasiones, a pesar de no considerarse a sí mismo como un héroe o salvador.", image: "https://res.cloudinary.com/dgtgbyo76/image/upload/v1699044374/hlpy6q013uw3itl5jzic.webp", affiliation: "Z Fighter", deletedAt: nil)
    
    return CharacterCardView(character: character)
        .preferredColorScheme(.dark)
}
