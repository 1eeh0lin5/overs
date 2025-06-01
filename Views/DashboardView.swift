import SwiftUI

/// 数据看板，展示月度收支环形图和翻译频次折线图，支持长按切换
struct DashboardView: View {
    @State private var showPieChart = true // 当前是否显示环形图
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(showPieChart ? "月度收支" : "翻译使用频次")
                .font(.headline)
                .padding(.leading, 8)
            ZStack {
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .fill(Color(.systemBackground))
                    .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
                if showPieChart {
                    // 替换为实际环形图
                    Text("环形图区域")
                        .foregroundColor(.accentColor)
                        .font(.title3)
                } else {
                    // 替换为实际折线图
                    Text("折线图区域")
                        .foregroundColor(.green)
                        .font(.title3)
                }
            }
            .frame(height: 160)
            .onLongPressGesture {
                withAnimation { showPieChart.toggle() }
            }
        }
        .padding(.horizontal)
    }
} 
