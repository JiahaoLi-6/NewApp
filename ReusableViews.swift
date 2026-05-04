//
//  ReusableView.swift
//  APP-Jiahao
//
//  Created by 1 on 20/4/2026.
//

import SwiftUI

struct CapsuleButton: View {
    let title: String

    var body: some View {
        HStack(spacing: 6) {
            Text(title)
                .font(.caption)
                .fontWeight(.medium)
            Image(systemName: "chevron.right")
                .font(.caption2)
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
        .background(Color.blue)
        .foregroundStyle(.white)
        .clipShape(Capsule())
    }
}

struct TaskCategoryRow: View {
    let task: TaskCategory

    var body: some View {
        HStack(spacing: 12) {
            RoundedRectangle(cornerRadius: 10)
                .fill(task.color.opacity(0.15))
                .frame(width: 42, height: 42)
                .overlay(
                    Image(systemName: task.icon)
                        .foregroundStyle(task.color)
                )

            VStack(alignment: .leading, spacing: 4) {
                Text(task.title)
                    .fontWeight(.semibold)

                Text(task.progressText)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }

            Spacer()

            Text(task.status.rawValue)
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundStyle(task.status.badgeColor)

            Image(systemName: "chevron.right")
                .foregroundStyle(.gray)
        }
        .padding()
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

struct StudyTimeRow: View {
    let item: StudyTimeItem
    let isSelected: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text("\(item.category) \(item.durationText)")
                    .fontWeight(.semibold)
                    .foregroundStyle(item.color)

                Spacer()

                Circle()
                    .fill(item.performance.badgeColor)
                    .frame(width: 12, height: 12)

                Text(item.performance.rawValue)
                    .font(.caption)
            }

            HStack(spacing: 12) {
                RoundedRectangle(cornerRadius: 10)
                    .fill(item.color.opacity(0.2))
                    .frame(width: 36, height: 36)
                    .overlay(Image(systemName: item.icon).foregroundStyle(item.color))

                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.gray.opacity(0.15))
                        .frame(height: 18)

                    RoundedRectangle(cornerRadius: 8)
                        .fill(
                            LinearGradient(
                                colors: [item.color.opacity(0.75), item.color.opacity(0.25)],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .frame(width: CGFloat(item.percentage) * 2.2, height: 18)
                }

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundStyle(.gray)
            }
        }
        .padding()
        .background(isSelected ? Color.white : Color.white.opacity(0.9))
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(isSelected ? item.color : Color.clear, lineWidth: 2)
        )
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

struct AchievementCard: View {
    let item: AchievementItem

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: item.icon)
                    .foregroundStyle(item.accentColor)
                Text(item.title)
                    .font(.title3)
                    .fontWeight(.bold)
            }

            Text(item.description)
                .font(.body)

            ProgressView(value: item.progress)
                .tint(.mint)
        }
        .padding()
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 24))
    }
}
