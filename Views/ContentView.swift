import SwiftUI

/// App主入口，展示个人中心页面
struct ContentView: View {
    var body: some View {
        NavigationView {
            // 个人中心主页面
            UserProfileView()
                .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
