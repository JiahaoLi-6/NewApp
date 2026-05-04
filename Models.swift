//
//  Model.swift
//  APP-Jiahao
//
//  Created by 1 on 20/4/2026.
//
import Foundation
import SwiftUI

struct TaskCategory: Identifiable, Hashable {
    let id = UUID()
    var title: String
    var completed: Int
    var total: Int
    var status: TaskStatus
    var color: Color
    var icon: String

    var progressText: String {
        "\(completed)/\(total)"
    }

    var progressValue: Double {
        guard total > 0 else { return 0 }
        return Double(completed) / Double(total)
    }
}

enum TaskStatus: String, CaseIterable {
    case completed = "Completed"
    case onTrack = "On Track"
    case improving = "Improving"
    case needsAttention = "Needs Attention"
    case behind = "Behind"
    case urgent = "Urgent"
    case todo = "To-do"

    var badgeColor: Color {
        switch self {
        case .completed, .onTrack:
            return .green
        case .improving:
            return .blue
        case .needsAttention:
            return .yellow
        case .behind, .urgent:
            return .red
        case .todo:
            return .gray
        }
    }
}

struct StudyTimeItem: Identifiable, Hashable {
    let id = UUID()
    var category: String
    var durationText: String
    var percentage: Int
    var performance: TaskStatus
    var color: Color
    var icon: String
}

struct SkillItem: Identifiable, Hashable {
    let id = UUID()
    var name: String
    var progress: Int
}

struct AchievementItem: Identifiable, Hashable {
    let id = UUID()
    var title: String
    var description: String
    var progress: Double
    var icon: String
    var accentColor: Color
}
