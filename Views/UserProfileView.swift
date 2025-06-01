import SwiftUI

/// 个人中心主页面，包含用户信息卡、数据看板、功能入口网格
struct UserProfileView: View {
    @StateObject var viewModel = UserViewModel() // 用户数据视图模型
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                UserInfoCard(user: viewModel.user)
                DashboardView()
//                FeatureGridView()
            }
            .padding(.top, 24)
        }
        .background(Color(.systemGroupedBackground).ignoresSafeArea())
        .refreshable {
            viewModel.refreshData()
        }
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
