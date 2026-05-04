//
//  ChatPlaceholderView.swift
//  APP-Jiahao
//
//  Created by 1 on 20/4/2026.
//


import SwiftUI

struct ChatPlaceholderView: View {
    @EnvironmentObject var appData: AppData

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Image(systemName: "message.fill")
                    .font(.system(size: 48))
                    .foregroundStyle(.blue)

                Text("AI Chat Placeholder")
                    .font(.title2)
                    .fontWeight(.bold)

                Text("This screen can be extended in later iterations.")
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)

                if let firstTask = appData.taskCategories.first {
                    NavigationLink(destination: TaskDetailView(task: firstTask)) {
                        Text("Open Example Task")
                            .fontWeight(.semibold)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .foregroundStyle(.white)
                            .clipShape(Capsule())
                    }
                    .padding(.horizontal)
                }

                Spacer()
            }
            .padding()
            .navigationTitle("Chat")
        }
    }
}