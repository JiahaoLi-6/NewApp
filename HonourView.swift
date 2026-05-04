//
//  HonourView.swift
//  APP-Jiahao
//
//  Created by 1 on 20/4/2026.
//

import SwiftUI

struct HonourView: View {
    @EnvironmentObject var appData: AppData

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                HStack {
                    Text("Honour")
                        .font(.largeTitle)
                        .fontWeight(.bold)

                    Spacer()

                    Menu {
                        Button("All") { }
                        Button("Unlocked") { }
                    } label: {
                        HStack {
                            Text("All")
                            Image(systemName: "chevron.down")
                        }
                        .padding(.horizontal, 14)
                        .padding(.vertical, 8)
                        .background(Color.white)
                        .clipShape(Capsule())
                    }
                }
                .padding(.horizontal)

                ForEach(appData.achievements) { achievement in
                    AchievementCard(item: achievement)
                        .padding(.horizontal)
                }
            }
            .padding(.top)
        }
        .background(Color(red: 0.93, green: 0.94, blue: 1.0))
    }
}
