import Foundation

@Observable
class DataLoader {
    static let fileURL: URL = {
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documentDirectory.appendingPathComponent("mps.json")
    }()

    static func loadMps() -> [MP] {
            
            guard let url = Bundle.main.url(forResource: "mps", withExtension: "json") else {
                print("Failed to find mps.json in bundle")
                return []
            }
            
            do {
                let data = try Data(contentsOf: url)
                let mps = try JSONDecoder().decode([MP].self, from: data)
                return mps
            } catch {
                print("Error loading MPs: \(error)")
                return []
            }
        }

    static func saveMps(_ mps: [MP]) {
        do {
            let data = try JSONEncoder().encode(mps)
            try data.write(to: fileURL)
        } catch {
            print("Failed to save MPs: \(error)")
        }
    }
}
