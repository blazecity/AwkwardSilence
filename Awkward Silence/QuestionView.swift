import SwiftUI

struct QuestionView: View {
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var questionHandler: QuestionHandler
    
    var body: some View {
        ZStack {
            Util.getBackgroundColor(darkModeEnabled: colorScheme == .dark)
            VStack {
                HStack(alignment: .top) {
                    Text(verbatim: questionHandler.currentQuestion)
                        .font(.system(size: 30))
                        .padding([.top, .bottom], 40)
                        .padding([.leading, .trailing], 20)
                }
                .frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity, minHeight: 0, idealHeight: 100, maxHeight: .infinity, alignment: .top)
                HStack {
                    Button("Next question") {
                        questionHandler.nextQuestion()
                    }
                    .frame(width: 350, height: 100, alignment: .center)
                    .background(Color(red: 51 / 255, green: 153 / 255, blue: 255 / 255))
                    .cornerRadius(20)
                    .font(.system(size: 40))
                    .foregroundColor(.white)
                }
            }
        }
    }
}
