# Mobile Development: IOS

Somativo - Projeto UIKit Avançado

Este projeto foi desenvolvido como parte da atividade **UIKit Avançado com SwiftUI**, com o objetivo de criar uma galeria de arte interativa que valorize a produção artística de artistas com ligação à cidade de Curitiba, utilizando recursos modernos do SwiftUI.



### 📌 Equipe:

- Amanda Queiroz Sobral
- Carlos Eduardo Domingues Hobmeier
- João Vitor de Freitas
- Théo Nicoleli 

  
### 📌 Demonstração em vídeo:

Funcionamento completo do aplicativo neste link: [YouTube](https://www.youtube.com/watch?v=BgcFqu5xLok)


### 📌 Objetivo:

Desenvolvimento de um aplicativo iOS com SwiftUI que:

- Apresente uma galeria visual de obras de arte curitibanas
- Use `LazyVGrid` com layout responsivo (Adaptive Columns)
- Exiba informações detalhadas sobre cada obra
- Permita navegação fluida entre a grade e os detalhes


### 📌 Estrutura de dados:

Foi criada uma `struct` chamada `ObraDeArte` contendo:

```swift
struct ObraDeArte: Identifiable {
    let id: UUID
    let titulo: String
    let artista: String
    let ano: Int
    let estilo: String
    let imagemNome: String
    let descricao: String
}
```

Os dados estão organizados em um array de obras, permitindo fácil iteração e exibição dinâmica.


### 📌 Grade com LazyVGrid:

As obras são exibidas utilizando `LazyVGrid`, dentro de um `ScrollView`, com:

- Imagem da obra (usando `System Images`)
- Título
- Nome do artista
- Layout responsivo com `GridItem(.adaptive(minimum: ...))`
- Modificadores `.aspectRatio`, `.padding`, `.frame`, `.clipShape`, entre outros para garantir um visual limpo e adaptável

![image](https://github.com/user-attachments/assets/6fca43e5-6c50-4c7f-b258-d22a73341a36)


### 📌 Navegação e interação:

- Cada item da galeria é um `NavigationLink` que leva a uma `DetalhesObraView`
- A tela de detalhes exibe:
  - Imagem em destaque
  - Título, artista, ano, estilo e descrição


### 📌 Boas práticas:

- Uso de `@State` e `@ObservedObject` para controle de estado
- Código modular e comentado
- Separação clara entre views e dados


### 📌 Desafios adicionais:

- Animações suaves ao selecionar os itens
- Layout fluido com transições suaves entre telas

