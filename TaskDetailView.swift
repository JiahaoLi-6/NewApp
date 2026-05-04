//
//  TaskDetailView.swift
//  APP-Jiahao
//
//  Created by 1 on 20/4/2026.
//
import SwiftUI

struct TaskDetailView: View {
    let task: TaskCategory

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(task.title)
                .font(.largeTitle)
                .fontWeight(.bold)

            Label("Progress: \(task.progressText)", systemImage: task.icon)
                .font(.headline)

            Text("Status: \(task.status.rawValue)")
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .background(task.status.badgeColor.opacity(0.15))
                .foregroundStyle(task.status.badgeColor)
                .clipShape(Capsule())

            ProgressView(value: task.progressValue)
                .tint(task.color)

            Text("This screen represents a basic task detail page for the semi-functional prototype.")
                .foregroundStyle(.secondary)

            Spacer()
        }
        .padding()
        .navigationTitle("Task Detail")
        .navigationBarTitleDisplayMode(.inline)
    }
}
