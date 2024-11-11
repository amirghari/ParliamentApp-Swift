//
//  MPPartyDetailView.swift
//  ParliamentApp
//
//  Created by Amir Ghari on 11/11/24.
//

import SwiftUI

struct MPPartyDetailView: View {
    @State private var mps = DataLoader.loadMps()
    var party: String
    var filteredMps: [MP] {
            mps.filter { $0.party == party }
        }

    var body: some View {
        NavigationView {
            List {
                ForEach(filteredMps) { mp in
                    NavigationLink(destination: MPDetailView(mp: mp)) {
                        MPRowView(mp: mp)
                    }
                }
            }
            .navigationTitle(party.uppercased())
        }
    }
}


