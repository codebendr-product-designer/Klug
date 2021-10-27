import SwiftUI
import CasePaths

class ItemRowViewModel: Identifiable, ObservableObject {
    
    var id: Item.ID { self.item.id }
//    @Published var deleteItemAlertIsPresented: Bool
    @Published var item: Item
//    @Published var itemToEdit: Item?
//    @Published var itemToDuplicate: Item?
    
    var onDelete: () -> Void = { }
    
    @Published var route: Route?

     enum Route {
       case deleteAlert
       case duplicate(Item)
       case edit(Item)
     }

    init(
      item: Item,
      route: Route? = nil
    ) {
      self.item = item
      self.route = route
    }
    
    func editButtonTapped() {
      self.route = .edit(self.item)
    }
    
    func deleteButtonTapped() {
      self.route = .deleteAlert
    }
    
    func deleteConfirmationButtonTapped() {
        self.onDelete()
    }
    
    func edit(item: Item) {
      self.item = item
      self.route = nil
    }

    func cancelButtonTapped() {
      self.route = nil
    }
    
}

struct ItemRowView: View {
    @ObservedObject var viewModel: ItemRowViewModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(viewModel.item.name)
                
                switch viewModel.item.status {
                case let .inStock(quantity):
                    Text("In stock: \(quantity)")
                case let .outOfStock(isOnBackOrder):
                    Text("Out of stock" + (isOnBackOrder ? ": on back order" : ""))
                }
            }
            
            Spacer()
            
            if let color = viewModel.item.color {
                Rectangle()
                    .frame(width: 30, height: 30)
                    .foregroundColor(color.swiftUIColor)
                    .border(Color.black, width: 1)
            }
            
            Button(action: { self.viewModel.duplicateButtonTapped() }) {
              Image(systemName: "square.fill.on.square.fill")
            }
            .padding(.leading)
            
            Button(action: { self.viewModel.editButtonTapped() }) {
              Image(systemName: "pencil")
            }
            .padding(.leading)
            
            Button {
                viewModel.deleteButtonTapped()
            } label: {
                Image(systemName: "trash.fill")
            }
            .padding(.leading)
            
        }
    //b    .buttonStyle(.plain)
    //    .foregroundColor(viewModel.item.status.isInStock ? nil : Color.gray)
        .alert(
          self.viewModel.item.name,
          isPresented: self.$viewModel.route.isPresent(/ItemRowViewModel.Route.deleteAlert),
          actions: {
            Button("Delete", role: .destructive) {
              self.viewModel.onDelete()
            }
          },
          message: {
            Text("Are you sure you want to delete this item?")
          }
        )
        .sheet(
            unwrap: self.$viewModel.route.case(/ItemRowViewModel.Route.edit)
          ) { $item in
            NavigationView {
              ItemView(item: $item)
                .toolbar {
                  ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                      self.viewModel.cancelButtonTapped()
                    }
                  }
                  ToolbarItem(placement: .primaryAction) {
                    Button("Save") {
                      self.viewModel.edit(item: item)
                    }
                  }
                }
                .navigationBarTitle("Edit")
            }
          }
            .popover(
            unwrap: self.$viewModel.route.case(/ItemRowViewModel.Route.duplicate)
          ) { $item in
            NavigationView {
              ItemView(item: $item)
                .navigationBarTitle("Duplicate")
                .toolbar {
                  ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                      self.viewModel.cancelButtonTapped()
                    }
                  }
                  ToolbarItem(placement: .primaryAction) {
                    Button("Add") {
                      self.viewModel.duplicate(item: item)
                    }
                  }
                }
            }
            .frame(minWidth: 300, minHeight: 500)
          }
    }
}