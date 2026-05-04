//
//  Data.swift
//  APP-Jiahao
//
//  Created by 1 on 20/4/2026.
//
import Foundation
import SwiftUI
import Combine

final class AppData: ObservableObject {
    @Published var taskCategories: [TaskCategory] = [
        TaskCategory(title: "Essay", completed: 6, total: 6, status: .completed, color: .blue, icon: "pencil"),
        TaskCategory(title: "Interview Video & Report", completed: 2, total: 2, status: .completed, color: .orange, icon: "square.and.pencil"),
        TaskCategory(title: "Case Study", completed: 1, total: 1, status: .urgent, color: .green, icon: "book"),
        TaskCategory(title: "Programming", completed: 0, total: 2, status: .todo, color: .gray, icon: "desktopcomputer")
    ]

    @Published var studyTimeItems: [StudyTimeItem] = [
        StudyTimeItem(category: "Essay", durationText: "3h15m", percentage: 38, performance: .onTrack, color: .orange, icon: "pencil"),
        StudyTimeItem(category: "Case Study", durationText: "2h15m", percentage: 34, performance: .improving, color: .purple, icon: "square.and.pencil"),
        StudyTimeItem(category: "Programming", durationText: "1h40m", percentage: 20, performance: .needsAttention, color: .pink, icon: "chevron.left.forwardslash.chevron.right"),
        StudyTimeItem(category: "Interview Report", durationText: "40m", percentage: 8, performance: .behind, color: .green, icon: "display")
    ]

    @Published var skills: [SkillItem] = [
        SkillItem(name: "Essay", progress: 76),
        SkillItem(name: "Focus", progress: 63),
        SkillItem(name: "Programming", progress: 75),
        SkillItem(name: "Report", progress: 27)
    ]

    @Published var achievements: [AchievementItem] = [
        AchievementItem(
            title: "Completed",
            description: "Tasks completed this month\nMore than 78% of users",
            progress: 0.78,
            icon: "trophy.fill",
            accentColor: .orange
        ),
        AchievementItem(
            title: "Streak",
            description: "3 day study streak\nMore consistent than 66% of users",
            progress: 0.66,
            icon: "flame.fill",
            accentColor: .red
        ),
        AchievementItem(
            title: "Improvement",
            description: "Faster progress than 60% of users in last 7 days",
            progress: 0.60,
            icon: "chart.line.uptrend.xyaxis",
            accentColor: .blue
        ),
        AchievementItem(
            title: "Next Goal",
            description: "Complete one more task this week!",
            progress: 0.72,
            icon: "star.fill",
            accentColor: .yellow
        )
    ]

    @Published var selectedTimeItem: StudyTimeItem?

    init() {
        selectedTimeItem = studyTimeItems.first
    }

    var completedTaskCount: Int {
        taskCategories.reduce(0) { $0 + $1.completed }
    }

    var totalTaskCount: Int {
        taskCategories.reduce(0) { $0 + $1.total }
    }

    var completionPercentage: Int {
        guard totalTaskCount > 0 else { return 0 }
        return Int((Double(completedTaskCount) / Double(totalTaskCount)) * 100)
    }

    var needsAttentionCount: Int {
        taskCategories.filter { $0.status == .urgent || $0.status == .todo }.count
    }
}
