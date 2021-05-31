//
//  File.swift
//  DesafioBeer
//
//  Created by Barbara Brigolin on 28/05/21.
//

import Foundation

class Service {
    
    private let baseUrl: String = "https://api.punkapi.com/v2/beers"

        // MARK: - Function
       
    func getBeer(completion: @escaping(_ success: [BeerElements]?, _ error: Error?) -> Void) {
        
        guard let url = URL(string: self.baseUrl) else{return completion(nil, nil)}
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request)  { data, response, error in
            guard error == nil else{return completion(nil, nil)}
            guard let dataResult = data else{return completion(nil, nil)}
            do {
                let beer: [BeerElements] = try JSONDecoder().decode([BeerElements].self, from: dataResult)
                completion(beer,nil)
            } catch {
                completion(nil,nil)
            }
        }
        task.resume()
    }
    

    
}

