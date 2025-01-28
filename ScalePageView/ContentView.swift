import SwiftUI
import CollectionViewPagingLayout

struct ContentView: View {
    @StateObject var factListVM = FactListViewModel()
    var options: ScaleTransformViewOptions {
        .layout(.linear)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                ScalePageView(factListVM.facts, selection: $factListVM.selectedFactId) { fact in
                    Image(fact.imageName)
                        .resizable()
                        .frame(width: 300, height: 300)
                        .overlay(alignment: .bottomTrailing) {
                            Text(fact.photoCredit)
                                .font(.callout)
                                .padding(6)
                                .foregroundStyle(.white)
                                .background(Color.black.opacity(0.8))
                        }
                        .cornerRadius(8)
                    
                }
                .options(options)
                .pagePadding(vertical: .absolute(100), horizontal: .absolute(80))
                
                if factListVM.selectedFactId != nil {
                    DetailView(id: factListVM.selectedFactId, vm: factListVM)
                }
                Spacer()
            }
            .padding()
            .navigationTitle("Happy Facts")
        }
        .onAppear {
            factListVM.fetch()
        }
    }
}

#Preview {
    ContentView()
        .colorScheme(.dark)
}
