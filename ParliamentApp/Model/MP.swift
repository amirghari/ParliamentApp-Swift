import Foundation
import SwiftData

@Model
class MP {
    var id: Int
    var seatNumber: Int
    var lastName: String
    var firstName: String
    var party: String
    var bornYear: Int
    var constituency: String
    var isFavoriteMember: Bool = false
    
    init(id: Int, seatNumber: Int, lastName: String, firstName: String, party: String, bornYear: Int, constituency: String, isFavoriteMember: Bool) {
        self.id = id
        self.seatNumber = seatNumber
        self.lastName = lastName
        self.firstName = firstName
        self.party = party
        self.bornYear = bornYear
        self.constituency = constituency
        self.isFavoriteMember = isFavoriteMember
    }
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

