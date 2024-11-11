//
//  MPRowView.swift
//  ParliamentApp
//
//  Created by Amir Ghari on 11/6/24.
//

import SwiftUI

struct MPRowView: View {
    var mp: MP

    var body: some View {
        HStack {
            Image(mp.party)
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
            
            VStack(alignment: .leading) {
                Text("\(mp.firstName) \(mp.lastName)")
                    .font(.headline)
                Text(mp.party)
                    .font(.subheadline)
            }
            Spacer()
            Image(systemName: mp.isFavorite ? "star.fill" : "star")
                .foregroundColor(.yellow)
        }
    }
}
