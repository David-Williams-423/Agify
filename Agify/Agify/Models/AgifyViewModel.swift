//
//  AgifyViewModel.swift
//  Agify
//
//  Created by David Williams on 9/15/22.
//

import Foundation

let baseURL = "https://api.agify.io?"

class AgifyViewModel: ObservableObject {
    
    @Published var names: [NameResult] = []
    
    func getNameAsync(name: String) async throws -> Bool {
            
        guard let url = URL(string: "\(baseURL)name=\(name)&country_id=US") else { return false }
        
        print(url)
        
        let (data, _) = try await URLSession.shared.data(from: url)

        let decoder = JSONDecoder()
        
        do {
            let result = try decoder.decode(NameResult.self, from: data)
            print("data:")
            
            if result.age == nil {
                return false
            }
            
            self.names.insert(result, at: 0)
            
           
        } catch {
            print(error)
        }
        
        return true
        
        
    }
    
    func clearNames() {
        
        self.names = []
        
    }
    
    
}
