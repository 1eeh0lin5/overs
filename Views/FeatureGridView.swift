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
//    Feature(icon: "doc", title: "导出"),
//    Feature(icon: "paintbrush", title: "主题"),
//    Feature(icon: "lock", title: "安全"),
//    Feature(icon: "creditcard", title: "会员"),
//    Feature(icon: "chart.bar", title: "统计"),
//    Feature(icon: "ellipsis", title: "更多")
]

/// 功能入口网格组件，3列布局，点击有缩放动效
struct FeatureGridView: View {
    @State private var pressedIndex: Int? = nil // 当前按下的功能索引
    let columns = Array(repeating: GridItem(.flexible(), spacing: 16), count: 3) // 3列布局
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 16) {
            ForEach(Array(features.enumerated()), id: \ .element.id) { index, feature in
                VStack {
                    // 功能图标
                    Image(systemName: feature.icon)
                        .resizable()
                        .frame(width: 44, height: 44)
                        // 点击时缩放动画
                        .scaleEffect(pressedIndex == index ? 0.9 : 1.0)
                        .animation(.spring(), value: pressedIndex)
                        .onTapGesture {
                            pressedIndex = index
                            // 动效后触发功能（如页面跳转）
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                pressedIndex = nil
                                // 跳转或触发功能（待实现）
                            }
                        }
                    // 功能名称
                    Text(feature.title)
                        .font(.custom(Theme.bodyFont, size: 15))
                }
                .padding(8)
            }
        }
        .padding([.leading, .trailing], 30)
    }
}

//struct FeatureGridView_Previews: PreviewProvider {
//    static var previews: some View {
//        FeatureGridView()
//            .previewLayout(.sizeThatFits) // 让预览更美观
//            .padding()
//    }
//}
