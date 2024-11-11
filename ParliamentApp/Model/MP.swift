import Foundation

struct MP: Identifiable, Codable {
    let id: Int
    let seatNumber: Int
    let lastName: String
    let firstName: String
    let party: String
    let bornYear: Int
    let constituency: String
    var isFavorite: Bool = false

    enum CodingKeys: String, CodingKey {
        case id = "personNumber"
        case seatNumber
        case lastName = "last"
        case firstName = "first"
        case party
        case bornYear
        case constituency
    }
}

