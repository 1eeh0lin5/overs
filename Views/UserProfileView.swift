import SwiftUI

/// 个人中心主页面，包含用户信息卡、数据看板、功能入口网格
struct UserProfileView: View {
    @StateObject var viewModel = UserViewModel() // 用户数据视图模型
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                // 用户信息卡片
                UserInfoCard(user: viewModel.user)
                // 数据看板
                DashboardView()
                // 功能入口网格
                FeatureGridView()
            }
            .padding(.top, 24)
        }
        // 全局背景色
        .background(Theme.neutralGray.ignoresSafeArea())
        // 下拉刷新，触发数据刷新
        .refreshable {
            viewModel.refreshData()
        }
        // 页面出现时自动获取用户数据
        .onAppear {
            viewModel.fetchUserData()
        }
    }
}

//struct UserProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserProfileView()
//    }
//}
