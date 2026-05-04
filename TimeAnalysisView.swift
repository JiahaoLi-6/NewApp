//
//  TimeAnalysisViews.swift
//  APP-Jiahao
//
//  Created by 1 on 20/4/2026.
//

import SwiftUI

struct TimeAnalysisView: View {
    @EnvironmentObject var appData: AppData

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 18) {
                HStack {
                    Text("Time Analysis")
                        .font(.largeTitle)
                        .fontWeight(.bold)

                    Spacer()

                    NavigationLink(destination: SkillTreeView().environmentObject(appData)) {
                        CapsuleButton(title: "Skill Tree")
                    }
                }
                .padding(.horizontal)

                donutChartCard

                Text("Time Breakdown")
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding(.horizontal)

                VStack(spacing: 10) {
                    ForEach(appData.studyTimeItems) { item in
                        Button {
                            appData.selectedTimeItem = item
                        } label: {
                            StudyTimeRow(item: item, isSelected: appData.selectedTimeItem?.id == item.id)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(.horizontal)

                if let selected = appData.selectedTimeItem {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Progress Insight")
                            .font(.headline)

                        Text("\(selected.category) is currently \(selected.performance.rawValue.lowercased()).")
                            .font(.subheadline)

                        Text(insightText(for: selected))
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                    .padding()
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 18))
                    .padding(.horizontal)
                }
            }
            .padding(.top)
        }
        .background(Color(red: 0.93, green: 0.94, blue: 1.0))
        .navigationBarBackButtonHidden(true)
    }

    private var donutChartCard: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 24)
                .fill(Color.white.opacity(0.9))

            VStack {
                ZStack {
                    Circle()
                        .trim(from: 0.0, to: 0.25)
                        .stroke(Color.orange.opacity(0.55), style: StrokeStyle(lineWidth: 22, lineCap: .round))
                        .frame(width: 180, height: 180)
                        .rotationEffect(.degrees(130))

                    Circle()
                        .trim(from: 0.0, to: 0.18)
                        .stroke(Color.green.opacity(0.75), style: StrokeStyle(lineWidth: 22, lineCap: .round))
                        .frame(width: 180, height: 180)
                        .rotationEffect(.degrees(30))

                    Circle()
                        .trim(from: 0.0, to: 0.18)
                        .stroke(Color.purple.opacity(0.85), style: StrokeStyle(lineWidth: 22, lineCap: .round))
                        .frame(width: 180, height: 180)
                        .rotationEffect(.degrees(-45))

                    Circle()
                        .trim(from: 0.0, to: 0.18)
                        .stroke(Color.pink.opacity(0.85), style: StrokeStyle(lineWidth: 22, lineCap: .round))
                        .frame(width: 180, height: 180)
                        .rotationEffect(.degrees(225))

                    VStack(spacing: 4) {
                        Text("Total Tasks\nSpent Time:")
                            .font(.caption)
                            .multilineTextAlignment(.center)
                        Text("8h30m")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                    }
                }
            }
        }
        .frame(height: 280)
        .padding(.horizontal)
    }

    private func insightText(for item: StudyTimeItem) -> String {
        switch item.performance {
        case .onTrack:
            return "You are managing this task well. Keep your current pace."
        case .improving:
            return "You are making steady progress. A little more focus can improve results."
        case .needsAttention:
            return "This task needs more time and better planning."
        case .behind:
            return "You are falling behind. Break this task into smaller steps first."
        case .completed:
            return "This task is already completed successfully."
        case .urgent:
            return "This task is urgent and should be prioritised now."
        case .todo:
            return "This task has not started yet. Consider beginning soon."
        }
    }
}
