import SwiftUI

struct TopicView: View {
    var body: some View {
        ScrollView {
            NavigationLink(destination: QuestionView(questionHandler: QuestionHandler(fileName: "questions_fun_small_talk", randomOrder: true))) {
                CardView(card: Card(title: "Fun small talk", description: "Funny questions for some small talk", backgroundColor: Color.init(red: 230 / 255, green: 255 / 255, blue: 242 / 255)))
            }
            
            NavigationLink(destination: QuestionView(questionHandler: QuestionHandler(fileName: "questions_for_date", randomOrder: true))) {
                CardView(card: Card(title: "Dating", description: "Around 130 questions for a date", backgroundColor: Color.init(red: 153 / 255, green: 204 / 255, blue: 230 / 255)))
            }
            
            NavigationLink(destination: QuestionView(questionHandler: QuestionHandler(fileName: "questions_to_fall_in_love", randomOrder: false))) {
                CardView(card: Card(title: "Falling in love", description: "36 questions to fall in love... The person who asks the question answers first.  At the end, look into each others' eyes for 2-4 minutes.", backgroundColor: Color.init(red: 255 / 255, green: 230 / 255, blue: 230 / 255)))
            }
            
            NavigationLink(destination: QuestionView(questionHandler: QuestionHandler(fileName: "questions_more_weirdness", randomOrder: true))) {
                CardView(card: Card(title: "More weird questions", description: "Even more random weird questions", backgroundColor: Color.init(red: 153 / 255, green: 153 / 255, blue: 255 / 255)))
            }
        }
    }
}
