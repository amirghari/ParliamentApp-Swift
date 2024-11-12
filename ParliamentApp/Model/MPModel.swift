//
//  MPModel.swift
//  ParliamentApp
//
//  Created by Amir Ghari on 11/12/24.
//
import Foundation

class MPModel: ObservableObject {
    @Published var mps: [MP] = []
    
    var favoriteMembers: [MP] {
        mps.filter { $0.isFavoriteMember }
    }
    
    var favoriteParties: [String] {
        Set(favoriteMembers.map { $0.party }).sorted()
    }

    init() {
        loadMps()
    }

    func loadMps() {
        if let localMps = DataLoader.loadLocalMps() {
            self.mps = localMps
        } else {
            DataLoader.loadRemoteMps { fetchedMps in
                DispatchQueue.main.async {
                    self.mps = fetchedMps ?? []
                }
            }
        }
    }

    func toggleFavorite(for member: MP) {
        if let index = mps.firstIndex(where: { $0.id == member.id }) {
            mps[index].isFavoriteMember.toggle()
            DataLoader.saveMps(mps)
        }
    }
}
