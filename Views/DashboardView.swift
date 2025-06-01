import SwiftUI

/// 数据看板，展示月度收支环形图和翻译频次折线图，支持长按切换
struct DashboardView: View {
    @State private var showPieChart = true // 当前是否显示环形图
    
    var body: some View {
        VStack(spacing: 16) {
            if showPieChart {
                // 环形图区域（可用第三方库或自定义）
                Text("月度收支环形图")
                    .frame(height: 80)
                    .background(Color.blue.opacity(0.4))
                    .cornerRadius(12)
            } else {
                // 折线图区域（可用第三方库或自定义）
                Text("翻译使用频次折线图")
                    .frame(height: 180)
                    .background(Color.green.opacity(0.1))
                    .cornerRadius(12)
            }
        }
        // 长按切换图表类型
        .onLongPressGesture {
            showPieChart.toggle()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(16)
        .shadow(radius: 4)
    }
}

//struct DashboardView_Previews: PreviewProvider {
//    static var previews: some View {
//        DashboardView()
//    }
//}
