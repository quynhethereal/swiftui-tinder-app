//
//  BotResponse.swift
//  Tinder-FE
//
//  Created by Gia Huy on 12/09/2022.
//

import Foundation

func getBotResponse(message: String) -> String {
    //MARK: MẢNG CHỨA CÁC CÂU HỎI CỦA USER CÓ THỂ XẢY RA
    
    let tempMessage = message.lowercased()
    
    if tempMessage.contains("bí quyết an toàn khi hẹn hò") {
        return """
Mình có thể liệt kê một số thứ cho bạn như sau:
- Không bao giờ gửi tiền hoặc chia sẻ thông tin tài chính
- Bảo vệ thông tin cá nhân của bạn. Không chia sẻ thông tin cá nhân
- Hãy cảnh giác với các mối quan hệ với khoảng cách xa và ở nước ngoài
- Báo cáo tất cả các hành vi đáng ngờ và mang tính xúc phạm
"""
    } else if tempMessage.contains("những lưu ý khi gặp gỡ trực tiếp") {
        return """
Mình có thể liệt kê một số thứ cho bạn như sau, bạn chú ý nha:
- Đừng vội vàng: Dành thời gian và làm quen với người khác trước khi đồng ý gặp gỡ hoặc trò chuyện ngoài Tinder.
- Gặp gỡ ở nơi công cộng và luôn ở nơi công cộng.
- Nói với bạn bè và gia đình về kế hoạch của bạn: Bao gồm cả thời gian và nơi bạn sẽ đi.
- Kiểm soát phương tiện đi lại của bạn: Bạn nên kiểm soát cách bạn đến và đi khỏi nơi diễn ra cuộc hẹn để bạn có thể rời đi bất cứ khi nào bạn muốn.
- Luôn biết đồ uống của bạn đến từ đâu và biết nó ở đâu.
- Nếu bạn cảm thấy không thoải mái, hãy rời đi: Nếu bạn cảm thấy không thoải mái, hãy kết thúc cuộc hẹn sớm.
"""
    } else if tempMessage.contains("how are you") {
        return "I'm fine, how about you?"
    } else {
        return "That's cool."
    }
}
