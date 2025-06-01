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
            Image(user.avatar)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 96, height: 96)
                .clipShape(Circle())
                .shadow(radius: 6)
                .overlay(
                    Circle().stroke(Color.accentColor, lineWidth: 2)
                )
                .padding(.top, 8)
                .onTapGesture {
                    // 头像更换逻辑
                }
                .onLongPressGesture {
                    isEditing = true
                }
            if isEditing {
                TextField("昵称", text: $nickname)
                    .font(.title2.bold())
                    .multilineTextAlignment(.center)
                TextField("签名", text: $signature)
                    .font(.caption)
                    .multilineTextAlignment(.center)
                Button("完成") {
                    isEditing = false
                    // 保存逻辑
                }
                .buttonStyle(.borderedProminent)
            } else {
                Text(user.nickname)
                    .font(.title2.bold())
                Text(user.level)
                    .font(.subheadline)
                    .foregroundColor(.accentColor)
                Text(user.signature)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .fill(Color(.secondarySystemBackground))
        )
        .padding(.horizontal)
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
