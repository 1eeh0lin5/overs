import Foundation
import Combine

/// 用户数据的视图模型，负责数据获取与刷新
class UserViewModel: ObservableObject {
    /// 当前用户信息，界面会自动响应变化
    @Published var user: User = User(avatar: "avatar_default", nickname: "未登录", level: "普通会员", signature: "这个人很懒，什么都没有写")
    
    /// 获取用户数据（模拟网络请求，实际可替换为API调用）
    func fetchUserData() {
        // 模拟异步获取数据
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.user = User(avatar: "avatar_sample", nickname: "小明", level: "高级会员", signature: "热爱生活，热爱编程")
        }
    }
    
    /// 刷新用户数据（实际调用fetchUserData）
    func refreshData() {
        fetchUserData()
    }
} 