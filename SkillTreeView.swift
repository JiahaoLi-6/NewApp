//
//  SkillTreeView.swift
//  APP-Jiahao
//
//  Created by 1 on 20/4/2026.
//
import SwiftUI

struct SkillTreeView: View {
    @EnvironmentObject var appData: AppData

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Title only, no Honour button
                HStack {
                    Text("Skill Tree")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Spacer()
                }
                .padding(.horizontal)

                // Visible skill tree card
                SkillTreeGraphic()
                    .padding(.horizontal)

                // Skills progress
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundStyle(.green)
                        Text("Skills Progress")
                            .font(.headline)
                        Spacer()
                    }

                    ForEach(appData.skills) { skill in
                        VStack(alignment: .leading, spacing: 4) {
                            HStack {
                                Text(skill.name)
                                Spacer()
                                Text("\(skill.progress)%")
                                    .fontWeight(.semibold)
                            }

                            ProgressView(value: Double(skill.progress), total: 100)
                                .tint(.green)
                        }
                    }
                }
                .padding()
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 18))
                .padding(.horizontal)

                // Insight card
                VStack(alignment: .leading, spacing: 8) {
                    Label("Skill improved on: Time Management", systemImage: "hand.thumbsup.fill")
                        .foregroundStyle(.orange)

                    Label("Needs Improvement: Focus", systemImage: "exclamationmark.triangle.fill")
                        .foregroundStyle(.yellow)
                }
                .font(.subheadline)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 18))
                .padding(.horizontal)
            }
            .padding(.top)
            .padding(.bottom, 30)
        }
        .background(Color(red: 0.93, green: 0.94, blue: 1.0))
        .navigationBarBackButtonHidden(true)
    }
}

struct SkillTreeGraphic: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 24)
                .fill(Color.white)

            VStack(spacing: 12) {
                Text("Growth Overview")
                    .font(.headline)
                    .padding(.top, 12)

                ZStack {
                    // Branch lines first
                    Path { path in
                        // trunk
                        path.move(to: CGPoint(x: 170, y: 230))
                        path.addLine(to: CGPoint(x: 170, y: 130))

                        // top branch
                        path.move(to: CGPoint(x: 170, y: 145))
                        path.addLine(to: CGPoint(x: 170, y: 80))

                        // left branch
                        path.move(to: CGPoint(x: 170, y: 150))
                        path.addLine(to: CGPoint(x: 95, y: 125))

                        // right branch
                        path.move(to: CGPoint(x: 170, y: 150))
                        path.addLine(to: CGPoint(x: 245, y: 125))

                        // lower left
                        path.move(to: CGPoint(x: 170, y: 185))
                        path.addLine(to: CGPoint(x: 110, y: 190))

                        // lower right
                        path.move(to: CGPoint(x: 170, y: 185))
                        path.addLine(to: CGPoint(x: 230, y: 190))
                    }
                    .stroke(Color.brown, lineWidth: 8)

                    // trunk
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.brown)
                        .frame(width: 28, height: 90)
                        .offset(y: 85)

                    // Main skills
                    SkillBubble(
                        title: "Time Management",
                        icon: "clock.fill",
                        color: .green
                    )
                    .offset(x: 0, y: -65)

                    SkillBubble(
                        title: "Focus",
                        icon: "scope",
                        color: .mint
                    )
                    .offset(x: -90, y: -5)

                    SkillBubble(
                        title: "Prioritisation",
                        icon: "target",
                        color: .green
                    )
                    .offset(x: 90, y: -5)

                    // Sub-skills
                    SmallSkillLeaf(title: "Break Tasks", color: .green)
                        .offset(x: -70, y: 65)

                    SmallSkillLeaf(title: "Use Timers", color: .green)
                        .offset(x: -90, y: 100)

                    SmallSkillLeaf(title: "High Priority", color: .green)
                        .offset(x: 70, y: 65)

                    SmallSkillLeaf(title: "Urgent Tasks", color: .green)
                        .offset(x: 90, y: 100)
                }
                .frame(width: 340, height: 300)

                Text("Your skills grow as you complete tasks and manage time effectively.")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .padding(.bottom, 12)
            }
        }
        .frame(height: 420)
    }
}

struct SkillBubble: View {
    let title: String
    let icon: String
    let color: Color

    var body: some View {
        VStack(spacing: 6) {
            Circle()
                .fill(color.opacity(0.2))
                .frame(width: 64, height: 64)
                .overlay(
                    Image(systemName: icon)
                        .foregroundStyle(color)
                        .font(.title2)
                )

            Text(title)
                .font(.caption)
                .fontWeight(.semibold)
                .padding(.horizontal, 10)
                .padding(.vertical, 6)
                .background(color.opacity(0.2))
                .clipShape(Capsule())
        }
    }
}

struct SmallSkillLeaf: View {
    let title: String
    let color: Color

    var body: some View {
        Text(title)
            .font(.caption2)
            .fontWeight(.medium)
            .padding(.horizontal, 10)
            .padding(.vertical, 6)
            .background(color.opacity(0.15))
            .clipShape(Capsule())
    }
}
