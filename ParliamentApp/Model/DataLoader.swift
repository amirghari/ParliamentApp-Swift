import Foundation

class DataLoader {
    static let urlString = "https://users.metropolia.fi/~peterh/mps.json"

    static func loadMps(completion: @escaping ([MP]?) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Failed to fetch data: \(error?.localizedDescription ?? "Unknown error")")
                completion(nil)
                return
            }
            
            do {
                let mps = try JSONDecoder().decode([MP].self, from: data)
                completion(mps)
            } catch {
                print("Failed to decode JSON: \(error.localizedDescription)")
                completion(nil)
            }
        }.resume()
    }
}
