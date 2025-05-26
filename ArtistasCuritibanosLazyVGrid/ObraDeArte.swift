import Foundation

struct ObraDeArte: Identifiable, Hashable {
    let id       = UUID()
    let titulo   : String
    let artista  : String
    let ano      : Int
    let estilo   : String
    let imagemNome: String   // nome da SF Symbol ou arquivo no Assets
    let descricao: String
}
