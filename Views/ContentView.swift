import SwiftUI

/// App主入口，展示个人中心页面
struct ContentView: View {
    var body: some View {
        TabView {
            UserProfileView()
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("个人中心")
                }
            AccountView()
                .tabItem {
                    Image(systemName: "book")
                    Text("记账")
                }
            TranslateView()
                .tabItem {
                    Image(systemName: "globe")
                    Text("翻译")
                }
            SettingsView()
                .tabItem {
                    Image(systemName: "gearshape")
                    Text("设置")
                }
        }
        .accentColor(.accentColor)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
