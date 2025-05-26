import SwiftUI

struct ContentView: View {
    @StateObject private var vm = GaleriaViewModel()
    
    private let itemsPerRowOptions = [1, 2, 3, 4]
    @State private var selectedItemsPerRow: Int = 2
    
    private var columns: [GridItem] {
        Array(repeating: GridItem(.flexible(), spacing: 16), count: selectedItemsPerRow)
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(vm.obrasFiltradas) { obra in
                        NavigationLink(value: obra) {
                            VStack {
                                Image(obra.imagemNome)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(maxWidth: .infinity)
                                    .aspectRatio(1, contentMode: .fit)
                                    .clipShape(RoundedRectangle(cornerRadius: 16))
                                    .shadow(radius: 4)
                                
                                Text(obra.titulo)
                                    .font(.headline)
                                    .lineLimit(1)
                                Text(obra.artista)
                                    .font(.subheadline)
                                    .foregroundStyle(.secondary)
                            }
                            .padding(.horizontal, 4)
                        }
                    }
                }
                .padding()
            }
            .safeAreaInset(edge: .top) {
                Rectangle()
                    .fill(Color.white)
                    .frame(height: 16)
            }
            .searchable(
                text: $vm.filtro,
                placement: .navigationBarDrawer(displayMode: .automatic),
                prompt: "Buscar por título ou artista"
            )
            // ── Toolbar: logo central + botão de layout ────────────────
            .toolbar {
                // Logo centralizado
                ToolbarItem(placement: .principal) {
                    Image("logo_artistas_curitibanos4")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 32)
                }
                
                // Botão para ciclar número de colunas
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: cycleLayoutOption) {
                        Image(systemName: layoutIconName)
                            .imageScale(.large)
                    }
                    .tint(.white)
                }
            }
            .navigationTitle("")
            .navigationDestination(for: ObraDeArte.self) { obra in
                DetalhesObraView(obra: obra)
            }
        }
    }
    
    // MARK: - Helpers
    
    /// Nome do SF Symbol correspondente ao layout atual
    private var layoutIconName: String {
        switch selectedItemsPerRow {
        case 1: return "rectangle"
        case 2: return "rectangle.split.2x1"
        case 3: return "rectangle.split.3x1"
        default: return "rectangle.grid.2x2"
        }
    }
    
    /// Avança para a próxima opção de colunas (1‒4)
    private func cycleLayoutOption() {
        guard let idx = itemsPerRowOptions.firstIndex(of: selectedItemsPerRow) else { return }
        withAnimation(.easeInOut) {
            selectedItemsPerRow = itemsPerRowOptions[(idx + 1) % itemsPerRowOptions.count]
        }
    }
}
