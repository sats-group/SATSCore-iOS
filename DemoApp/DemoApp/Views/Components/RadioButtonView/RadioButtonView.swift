import SwiftUI

struct RadioButtonView: View {
    @State private var selectedNumber = 0
    
    var body: some View {
        VStack(spacing: 0) {
            radioButton(forItem: 0)
            radioButton(forItem: 1)
            radioButton(forItem: 2)
        }
        .navigationTitle("RadioButton")
    }
    
    private func radioButton(forItem item: Int) -> some View {
        RadioButton(item: item, selectedItem: selectedNumber)
            .padding()
            .onTapGesture { selectedNumber = item }
    }
}

struct RadioButtonView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RadioButtonView()
        }
    }
}
