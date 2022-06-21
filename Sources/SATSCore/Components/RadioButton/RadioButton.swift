import SwiftUI

public struct RadioButton<Item: Equatable>: View {
    let item: Item
    let selectedItem: Item
    
    private var isSelected: Bool { item == selectedItem }
    private var fill: Color { isSelected ? .onBackgroundEnabledOn : .graphicalElements1 }
    private var lineWidth: CGFloat = 2
    
    public init(item: Item, selectedItem: Item) {
        self.item = item
        self.selectedItem = selectedItem
    }
    
    public var body: some View {
        Circle()
            .strokeBorder(fill, lineWidth: lineWidth)
            .frame(size: 24)
            .if(isSelected, transform: { circle in
                circle
                    .overlay(
                        Circle()
                            .fill(fill)
                            .padding(lineWidth * 2)
                    )
            })
    }
}

struct RadioButton_Previews: PreviewProvider {
    struct Demo: View {
        @State private var selectedNumber = 0
        
        var body: some View {
            VStack(spacing: 0) {
                RadioButton(item: 0, selectedItem: selectedNumber)
                RadioButton(item: 1, selectedItem: selectedNumber)
                RadioButton(item: 2, selectedItem: selectedNumber)
                RadioButton(item: 3, selectedItem: selectedNumber)
            }
        }
    }
    
    static var previews: some View {
        Demo()
    }
}
