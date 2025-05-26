import SwiftUI

struct DetalhesObraView: View {
    let obra: ObraDeArte
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Image(systemName: obra.imagemNome)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .aspectRatio(1, contentMode: .fit)
                    .padding()
                    .background(.thickMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 24))
                
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
