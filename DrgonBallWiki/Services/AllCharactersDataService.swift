//
//  AllCharactersDataService.swift
//  DrgonBollWiki
//
//  Created by Jacob Aguilar on 03-03-24.
//

import Foundation

class AllCharactersDataService: AllCharactersProtocol {
    private let allCharactersEndPoint = "https://dragonball-api.com/api/characters?page=1&limit=58"
                                        
    ///Obtiene todos los personajes de Dragonball API
    /// - Returns: Una instancia de `Characters` la cual contiene toda la información básica de cada personaje
    func getCharacters() async throws -> Characters {
        do {
            guard let url = URL(string: allCharactersEndPoint) else {
                throw ApiError.invalidURL
            }
            
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                throw ApiError.invalidURL
            }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(Characters.self, from: data)
        } catch {
            throw error
        }
    }
}
