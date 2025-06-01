import SwiftUI

/// 功能入口结构体，包含图标和标题
struct Feature: Identifiable {
    let id = UUID()
    let icon: String // SF Symbol 图标名
    let title: String // 功能名称
}

/// 功能列表，3x4网格布局
let features = [
    Feature(icon: "book", title: "记账"),
    Feature(icon: "globe", title: "翻译"),
    Feature(icon: "person", title: "个人中心"),
    Feature(icon: "gear", title: "设置"),
    Feature(icon: "bell", title: "通知"),
    Feature(icon: "cloud", title: "同步"),
    Feature(icon: "doc", title: "导出"),
    Feature(icon: "paintbrush", title: "主题"),
    Feature(icon: "lock", title: "安全"),
    Feature(icon: "creditcard", title: "会员"),
    Feature(icon: "chart.bar", title: "统计"),
    Feature(icon: "ellipsis", title: "更多")
]

/// 功能入口网格组件，3列布局，点击有缩放动效
struct FeatureGridView: View {
    @State private var pressedIndex: Int? = nil // 当前按下的功能索引
    let columns = Array(repeating: GridItem(.flexible(), spacing: 12), count: 3) // 3列布局
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 20) {
            ForEach(Array(features.enumerated()), id: \ .element.id) { index, feature in
                Button(action: {
                    pressedIndex = index
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                        pressedIndex = nil
                        // 跳转或触发功能
                    }
                }) {
                    VStack(spacing: 6) {
                        Image(systemName: feature.icon)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 36, height: 36)
                            .foregroundColor(.accentColor)
                            .scaleEffect(pressedIndex == index ? 0.92 : 1.0)
                            .animation(.spring(response: 0.3, dampingFraction: 0.6), value: pressedIndex)
                        Text(feature.title)
                            .font(.footnote)
                            .foregroundColor(.primary)
                    }
                    .padding(8)
                    .background(
                        RoundedRectangle(cornerRadius: 12, style: .continuous)
                            .fill(Color(.systemBackground))
                            .shadow(color: .black.opacity(0.03), radius: 2, x: 0, y: 1)
                    )
                }
                .buttonStyle(.plain)
            }
        }
        .padding(.horizontal)
    }
}

//struct FeatureGridView_Previews: PreviewProvider {
//    static var previews: some View {
//        FeatureGridView()
//            .previewLayout(.sizeThatFits) // 让预览更美观
//            .padding()
//    }
//}
