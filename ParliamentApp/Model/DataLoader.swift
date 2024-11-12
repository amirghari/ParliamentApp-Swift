import Foundation

class DataLoader: ObservableObject {
    @Published var mps: [MP] = []

    private static let urlString = "https://users.metropolia.fi/~peterh/mps.json"
    private static let fileURL: URL = {
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documentDirectory.appendingPathComponent("mps.json")
    }()

    init() {
        loadMps()
    }

    func loadMps() {
        if let localMps = loadLocalMps() {
            self.mps = localMps
        } else {
            loadRemoteMps()
        }
    }

    private func loadRemoteMps() {
        guard let url = URL(string: DataLoader.urlString) else {
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Failed to fetch data: \(error?.localizedDescription ?? "Unknown error")")
                return
            }

            do {
                let fetchedMps = try JSONDecoder().decode([MP].self, from: data)
                DispatchQueue.main.async {
                    self.mps = fetchedMps
                    DataLoader.saveMps(fetchedMps)
                }
            } catch {
                print("Failed to decode JSON: \(error.localizedDescription)")
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

    private func loadLocalMps() -> [MP]? {
        if let data = try? Data(contentsOf: DataLoader.fileURL),
           let mps = try? JSONDecoder().decode([MP].self, from: data) {
            return mps
        }
        return nil
    }
}
