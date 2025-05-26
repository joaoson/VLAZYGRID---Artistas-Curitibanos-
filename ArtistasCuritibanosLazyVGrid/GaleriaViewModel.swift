import Foundation
import Combine

final class GaleriaViewModel: ObservableObject {
    @Published var obras: [ObraDeArte] = [
        .init(titulo: "Araucárias", artista: "Poty Lazzarotto",
              ano: 1962, estilo: "Gravura", imagemNome: "leaf", // SF Symbol
              descricao: "Um painel celebrando a araucária, árvore-símbolo do Paraná."),
        .init(titulo: "Retrato de Curitiba", artista: "Eliane Prolik",
              ano: 2001, estilo: "Escultura", imagemNome: "building.columns",
              descricao: "Prolik mistura concreto e aço para refletir a urbanidade curitibana.")
        // …adicione quantas obras quiser
    ]
    
    @Published var filtro: String = ""
    
    var obrasFiltradas: [ObraDeArte] {
        guard !filtro.isEmpty else { return obras }
        return obras.filter {
            $0.titulo.localizedCaseInsensitiveContains(filtro) ||
            $0.artista.localizedCaseInsensitiveContains(filtro)
        }
    }
}
