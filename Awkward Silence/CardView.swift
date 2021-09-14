import SwiftUI

struct Card {
    var title: String
    var description: String
    var backgroundColor: Color
}

struct CardView: View {
    var card: Card
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(card.title).font(.title).fontWeight(.bold).foregroundColor(.black).padding(.bottom, 10)
            HStack {
                Text(card.description)
                    .font(.system(size: 18)).foregroundColor(.black)
            }
        }
        .padding()
        .frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity, minHeight: 0, idealHeight: 150, maxHeight: .infinity, alignment: .topLeading)
        .border(card.backgroundColor)
        .background(card.backgroundColor)
        .cornerRadius(15.0)
        .padding(8)
    }
}
