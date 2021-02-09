import SwiftUI

struct ClassSampleView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Your most booked")
                .font(.satsH3())
                .padding(.horizontal, 20)

            ScrollView(.horizontal) {
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        Image("class-1")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .overlay(
                                VStack {
                                    Text("on wednesday".uppercased())
                                        .font(.satsSmall())
                                        .foregroundColor(.onButtonPrimary)
                                        .padding(8)
                                        .background(Color.black.opacity(0.5))
                                        .cornerRadius(4)
                                }
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                            )
                            .frame(width: 223, height: 150)
                            .cornerRadius(5)
                            .clipped()

                        Text("GROUP CLASS")
                            .font(.satsSmall())
                        Text("Cycling Intervals")
                            .font(.satsLarge())
                        Text("Carl Berner")
                            .font(.satsSmall())
                            .foregroundColor(.onBackgroundPrimarySecondary)
                    }

                    VStack(alignment: .leading) {
                        Image("class-2")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 223, height: 150)
                            .cornerRadius(5)

                        Text("GROUP CLASS")
                            .font(.satsSmall())
                        Text("Cycling Intervals")
                            .font(.satsLarge())
                        Text("Carl Berner")
                            .font(.satsSmall())
                            .foregroundColor(.onBackgroundPrimarySecondary)
                    }
                }
            }
            .padding(.leading, 20)
        }
        .foregroundColor(.onBackgroundPrimary)
        .padding(.horizontal, -20)
    }
}

struct ClassSampleView_Previews: PreviewProvider {
    static var previews: some View {
        ClassSampleView()
            .padding()
    }
}
