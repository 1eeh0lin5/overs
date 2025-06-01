import SwiftUI

struct TranslateView: View {
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "globe")
                .font(.system(size: 48))
                .foregroundColor(.accentColor)
            Text("翻译页面")
                .font(.title2)
                .foregroundColor(.secondary)
            Spacer()
        }
        .background(Color(.systemGroupedBackground).ignoresSafeArea())
    }
} 
