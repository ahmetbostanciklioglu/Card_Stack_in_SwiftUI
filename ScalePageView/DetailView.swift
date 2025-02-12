import SwiftUI

struct DetailView: View {
    let id: UUID?
    var vm:FactListViewModel
    var body: some View {
            VStack {
                Text(vm.selectedFact(id: id)?.title ?? "")
                    .font(.largeTitle)
                
                Text(vm.selectedFact(id: id)?.caption ?? "")
                Spacer()
            }
            .padding()
    }
}


struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        let factListVM = FactListViewModel()
        DetailView(id: factListVM.facts[0].id, vm: factListVM)
    }
}
