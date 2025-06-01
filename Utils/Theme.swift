import SwiftUI

/// 全局主题配置，包括主色调、辅助色、背景色和字体
struct Theme {
    /// 品牌主色（科技蓝），用于导航栏、按钮等
    static let mainBlue = Color(hex: "#2A5CAA")
    /// 辅助色（财务绿），用于数据看板、进度提示
    static let financeGreen = Color(hex: "#28A745")
    /// 中性灰，作为全局背景色，减少视觉疲劳
    static let neutralGray = Color(hex: "#F5F5F5")
    /// 标题字体
    static let titleFont = "SFProDisplay-Bold"
    /// 正文字体
    static let bodyFont = "SFProText-Regular"
    /// 辅助文本字体
    static let captionFont = "SFProText-Light"
}

/// 颜色扩展，支持通过十六进制字符串初始化Color
extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >> 8) & 0xFF) / 255.0
        let b = Double(rgb & 0xFF) / 255.0
        self.init(red: r, green: g, blue: b)
    }
} 