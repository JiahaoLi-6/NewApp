//
//  ReusableViews.swift
//  APP-Jiahao
//
//  Created by 1 on 20/4/2026.
//

import SwiftUI

struct WeeklySummaryView: View {
    @EnvironmentObject var appData: AppData

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                header

                NavigationLink(destination: TimeAnalysisView().environmentObject(appData)) {
                    progressCard
                }
                .buttonStyle(.plain)

                Text("Tasks Category")
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding(.horizontal)

                VStack(spacing: 12) {
                    ForEach(appData.taskCategories) { task in
                        NavigationLink(destination: TaskDetailView(task: task)) {
                            TaskCategoryRow(task: task)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(.horizontal)

                Button {
                } label: {
                    HStack {
                        Text("Prioritise \(appData.needsAttentionCount) remaining tasks")
                        Spacer()
                        Image(systemName: "chevron.right")
                    }
                    .padding()
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                }
                .buttonStyle(.plain)
                .padding(.horizontal)

                Button {
                } label: {
                    Text("Prioritise Now")
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundStyle(.white)
                        .clipShape(Capsule())
                }
                .padding(.horizontal)
            }
            .padding(.top)
        }
        .background(Color(red: 0.93, green: 0.94, blue: 1.0))
        .navigationBarHidden(true)
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text("Weekly\nSummary")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)

                Spacer()

                Circle()
                    .fill(Color.white)
                    .frame(width: 42, height: 42)
                    .overlay(Image(systemName: "bell.fill").foregroundStyle(.blue))
            }
            .padding(.horizontal)

            HStack(spacing: 8) {
                NavigationLink(destination: TimeAnalysisView().environmentObject(appData)) {
                    CapsuleButton(title: "Time Analysis")
                }
                NavigationLink(destination: SkillTreeView().environmentObject(appData)) {
                    CapsuleButton(title: "Skill Tree")
                }
            }
            .padding(.horizontal)
        }
    }

    private var progressCard: some View {
        VStack(spacing: 12) {
            ZStack {
                Circle()
                    .trim(from: 0.0, to: 0.72)
                    .stroke(Color.gray.opacity(0.35), style: StrokeStyle(lineWidth: 20, lineCap: .round))
                    .frame(width: 170, height: 170)
                    .rotationEffect(.degrees(135))

                Circle()
                    .trim(from: 0.0, to: 0.20)
                    .stroke(Color.purple, style: StrokeStyle(lineWidth: 20, lineCap: .round))
                    .frame(width: 170, height: 170)
                    .rotationEffect(.degrees(-20))

                Circle()
                    .trim(from: 0.0, to: 0.20)
                    .stroke(Color.orange, style: StrokeStyle(lineWidth: 20, lineCap: .round))
                    .frame(width: 170, height: 170)
                    .rotationEffect(.degrees(65))

                Circle()
                    .trim(from: 0.0, to: 0.20)
                    .stroke(Color.mint, style: StrokeStyle(lineWidth: 20, lineCap: .round))
                    .frame(width: 170, height: 170)
                    .rotationEffect(.degrees(155))

                VStack(spacing: 2) {
                    Text("Total Tasks\nCompleted:")
                        .font(.caption)
                        .multilineTextAlignment(.center)
                    Text("\(appData.completionPercentage)%")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.white.opacity(0.9))
        .clipShape(RoundedRectangle(cornerRadius: 24))
        .padding(.horizontal)
    }
}
