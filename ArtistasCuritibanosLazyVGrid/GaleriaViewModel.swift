// Responsável por fornecer dados e controlar o filtro de busca
import Foundation
import Combine

final class GaleriaViewModel: ObservableObject {
    /// Lista completa de obras disponíveis
    @Published var obras: [ObraDeArte] = [
        .init(titulo: "Araucárias", artista: "Poty Lazzarotto",
              ano: 1962, estilo: "Gravura", imagemNome: "leaf", // SF Symbol
              descricao: "Um painel celebrando a araucária, árvore-símbolo do Paraná."),
        .init(titulo: "Retrato de Curitiba", artista: "Eliane Prolik",
              ano: 2001, estilo: "Escultura", imagemNome: "building.columns",
              descricao: "Prolik mistura concreto e aço para refletir a urbanidade curitibana.")
    ]

    /// Texto de busca digitado pelo usuário
    @Published var filtro: String = ""

    /// Retorna apenas as obras cujo título ou artista contêm o filtro
    var obrasFiltradas: [ObraDeArte] {
        guard !filtro.isEmpty else { return obras }
        return obras.filter {
            $0.titulo.localizedCaseInsensitiveContains(filtro) ||
            $0.artista.localizedCaseInsensitiveContains(filtro)
        }
    }
}
