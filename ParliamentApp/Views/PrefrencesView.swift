//
//  PrefrencesView.swift
//  ParliamentApp
//
//  Created by Amir Ghari on 11/11/24.
//

import SwiftUI

struct PrefrencesView: View {
    @Binding var mps: [MP]

        var favoriteParties: [String] {
            let favoriteMps = mps.filter { $0.isFavoriteMember }
            return Array(Set(favoriteMps.map { $0.party }))
        }

        var favoriteMembers: [MP] {
            mps.filter { $0.isFavoriteMember }
        }

        var body: some View {
            NavigationView {
                List {
                    Section(header: Text("Favorite Parties")) {
                        ForEach(favoriteParties, id: \.self) { party in
                            Text(party.uppercased())
                        }
                    }

                    Section(header: Text("Favorite Members")) {
                        ForEach(favoriteMembers) { mp in
                            MPRowView(mp: mp)
                        }
                    }
                }
                .navigationTitle("Preferences")
            }
        }
}

