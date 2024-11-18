import Foundation

class DataLoader {
    static let urlString = "https://users.metropolia.fi/~peterh/mps.json"
    static let fileURL: URL = {
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documentDirectory.appendingPathComponent("mps.json")
    }()

    static func loadRemoteMps(completion: @escaping ([MP]?) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                print("Failed to fetch data: \(error?.localizedDescription ?? "Unknown error")")
                completion(nil)
                return
            }

            do {
                let mps = try JSONDecoder().decode([MP].self, from: data)
                saveMps(mps)
                completion(mps)
            } catch {
                print("Failed to decode JSON: \(error.localizedDescription)")
                completion(nil)
            }
        }.resume()
    }

    static func saveMps(_ mps: [MP]) {
        do {
            let data = try JSONEncoder().encode(mps)
            try data.write(to: fileURL)
        } catch {
            print("Failed to save MPs: \(error)")
        }
    }

    static func loadLocalMps() -> [MP]? {
        if let data = try? Data(contentsOf: fileURL),
           let mps = try? JSONDecoder().decode([MP].self, from: data) {
            return mps
        }
        return nil
    }


}
