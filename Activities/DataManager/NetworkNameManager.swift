//
//  NetworkNameManager.swift
//  Activities
//
//  Created by Alisa Ts on 26.11.2021.
//

import Foundation

struct NetworkNameManager {
    
    var onCompletion: ((CurrentName) -> Void)?
    
    func fetchCurrentName(forName name: String) {
        let urlString =
        "https://api.genderize.io/?name=\(name)"
        guard let url = URL(string: urlString) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if let data = data {
                if let currentName = self.parseJSON(withData: data) {
                    self.onCompletion?(currentName)
                }
            }
        }
        task.resume()
    }
    
    func parseJSON(withData data: Data) -> CurrentName? {
        let decoder = JSONDecoder()
        do {
            let currentNameData = try decoder.decode(CurrentNameData.self, from: data)
            guard let currentName = CurrentName(currentNameData: currentNameData) else {
                return nil
            }
            return currentName
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
}
