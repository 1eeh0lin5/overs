import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("功能")) {
                    NavigationLink(destination: NotificationsView()) {
                        Label("通知", systemImage: "bell")
                    }
                    NavigationLink(destination: SyncView()) {
                        Label("同步", systemImage: "cloud")
                    }
                    NavigationLink(destination: ExportView()) {
                        Label("导出", systemImage: "doc")
                    }
                    NavigationLink(destination: ThemeView()) {
                        Label("主题", systemImage: "paintbrush")
                    }
                    NavigationLink(destination: SecurityView()) {
                        Label("安全", systemImage: "lock")
                    }
                    NavigationLink(destination: StatisticsView()) {
                        Label("统计", systemImage: "chart.bar")
                    }
                    NavigationLink(destination: MoreView()) {
                        Label("更多", systemImage: "ellipsis")
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("设置")
        }
    }
}

// 占位子页面
struct NotificationsView: View { var body: some View { Text("通知设置").font(.title2).foregroundColor(.secondary) } }
struct SyncView: View { var body: some View { Text("同步设置").font(.title2).foregroundColor(.secondary) } }
struct ExportView: View { var body: some View { Text("导出设置").font(.title2).foregroundColor(.secondary) } }
struct ThemeView: View { var body: some View { Text("主题设置").font(.title2).foregroundColor(.secondary) } }
struct SecurityView: View { var body: some View { Text("安全设置").font(.title2).foregroundColor(.secondary) } }
struct StatisticsView: View { var body: some View { Text("统计设置").font(.title2).foregroundColor(.secondary) } }
struct MoreView: View { var body: some View { Text("更多功能").font(.title2).foregroundColor(.secondary) } } 
