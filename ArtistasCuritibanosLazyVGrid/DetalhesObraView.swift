// Tela de detalhes que exibe todas as informações da obra selecionada
import SwiftUI

struct DetalhesObraView: View {
    let obra: ObraDeArte
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                // Imagem maior da obra com fundo em material e cantos arredondados
                Image(systemName: obra.imagemNome)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .aspectRatio(1, contentMode: .fit)
                    .padding()
                    .background(.thickMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 24))
                
                // Grupo de textos com dados da obra
                Group {
                    Text(obra.titulo)
                        .font(.title.bold())
                    Text("Artista: \(obra.artista)")
                    Text("Ano: \(obra.ano)")
                    Text("Estilo: \(obra.estilo)")
                    Text(obra.descricao)
                        .padding(.top, 8)
                }
                .font(.body)
            }
            .padding()
        }
        .navigationTitle(obra.titulo)
        .navigationBarTitleDisplayMode(.inline)
    }
}
