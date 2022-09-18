/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 3
  Author: Error Team
     Duong Tuan Dat - s3636739
     Le Trung Kim - s3634824
     Le Dinh Ngoc Quynh - s3791159
     Thuan Nguyen - s3517236
  Created  date: 27/08/2022
  Last modified: 18/09/2022
  Acknowledgement: Acknowledge the resources that you use here.
*/

import Foundation

// simple if-else hehe
func getBotResponse(message: String) -> String {
    
    let tempMessage = message.lowercased()
    
    if tempMessage.contains("safety tips when dating") {
        return """
I can list a few for you as follows:
- Never send money or share financial information
- Protect your personal information. Do not share personal information
- Be wary of relationships with long distances and abroad
- Report all suspicious and offensive behavior
"""
    } else if tempMessage.contains("notes when meeting face-to-face") {
        return """
I can list a few things for you as follows, please pay attention:
Don't rush: Take your time and get to know others before agreeing to meet or chat outside of Tinder.
- Meet in public and always in public.
- Tell friends and family about your plans: Include when and where you're going.
- Control your transportation: You should control how you get to and from your appointment so you can leave whenever you want.
- Always know where your drink is coming from and know where it is.
- If you feel uncomfortable, leave: If you feel uncomfortable, end the appointment early.
"""
    } else if tempMessage.contains("if your 15 year old self could see you today, what would they think?") {
        return "It’s fascinating to learn how people view themselves, and how they see how far they’ve come/grown over the years."
    } else if tempMessage.contains("what would it take for someone to take you off this app?") {
        return "Such a question will give you insights into what they’re looking for, as well as how hard you’re gonna have to work. "
    } else if tempMessage.contains("tea, coffee or tequila?") {
        return "Just so you can get some date ideas."
    } else if tempMessage.contains("what’s something you would never tell anyone but a total stranger you’ll never meet again?") {
        return "This question will really get them thinking and it could throw up a really interesting answer!"
    } else if tempMessage.contains("what’s your idea of a perfect date?") {
        return "This, first date, is a good question to ask your Tinder match if you’re looking for someone to start a long-term relationship with. Why? Because the answer should give you a fairly good idea of what it would be like to spend time together. Like actual time."
    } else if tempMessage.contains("how much time do you think a couple should spend apart?") {
        return "This can be a really important question to ask on an online dating app like Tinder, especially if you’re an independent person."
    } else if tempMessage.contains("what was the worst date you ever went on?") {
        return "We’ve all had perfect dates. But what about the worst dates? The memories could have you both roaring with laughter."
    } else if tempMessage.contains("what’s your idea of a perfect day? ") {
        return "Because you need to know if their idea of a perfect day matches up with yours."
    }
    
    else {
        return "That's cool."
    }
}
