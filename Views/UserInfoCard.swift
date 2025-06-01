import SwiftUI

/// 用户信息卡片，展示头像、昵称、等级、签名，支持长按编辑
struct UserInfoCard: View {
    @State private var isEditing = false // 是否处于编辑状态
    @State private var nickname: String // 编辑中的昵称
    @State private var signature: String // 编辑中的签名
    var user: User // 当前用户信息
    
    init(user: User) {
        self.user = user
        _nickname = State(initialValue: user.nickname)
        _signature = State(initialValue: user.signature)
    }
    
    var body: some View {
        VStack(spacing: 12) {
            // 头像
            Image(user.avatar)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 120, height: 120)
                .clipShape(Circle())
                .overlay(Circle().stroke(Theme.mainBlue, lineWidth: 4))
                .onTapGesture {
                    // 头像更换逻辑（待实现）
                }
                .onLongPressGesture {
                    // 长按进入编辑状态
                    isEditing = true
                }
            if isEditing {
                // 编辑昵称
                TextField("昵称", text: $nickname)
                    .font(.custom(Theme.titleFont, size: 20))
                    .multilineTextAlignment(.center)
                // 编辑签名
                TextField("签名", text: $signature)
                    .font(.custom(Theme.captionFont, size: 14))
                    .multilineTextAlignment(.center)
                // 完成按钮，保存编辑内容
                Button("完成") {
                    isEditing = false
                    // 保存逻辑（待实现）
                }
            } else {
                // 显示昵称
                Text(user.nickname)
                    .font(.custom(Theme.titleFont, size: 20))
                // 显示会员等级
                Text(user.level)
                    .font(.custom(Theme.bodyFont, size: 17))
                    .foregroundColor(Theme.financeGreen)
                // 显示签名
                Text(user.signature)
                    .font(.custom(Theme.captionFont, size: 14))
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(16)
        .shadow(radius: 4)
    }
} 

struct UserInfoCard_Previews: PreviewProvider {
    static var previews: some View {
        // 这里传入一个示例用户
        UserInfoCard(user: User(
            avatar: "avatar_default", // 你可以用项目中的图片名
            nickname: "预览昵称",
            level: "高级会员",
            signature: "这是一个签名示例"
        ))
        .previewLayout(.sizeThatFits) // 让预览更美观
        .padding()
    }
}
