import SwiftUI

struct AccountView: View {
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "book")
                .font(.system(size: 48))
                .foregroundColor(.accentColor)
            Text("记账页面")
                .font(.title2)
                .foregroundColor(.secondary)
            Spacer()
        }
        .background(Color(.systemGroupedBackground).ignoresSafeArea())
    }
} 
