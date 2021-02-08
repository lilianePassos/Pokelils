import SwiftUI

struct PokemonDetail: View {

    var pokemonURL: URL
    @State private var pokemon: Pokemon?

    var body: some View {
        VStack(alignment: .center){
            if let pokemon = pokemon {
                RemoteImage(url: pokemon.sprites.frontDefault)
                            .aspectRatio(contentMode: .fill)
                    .padding(.top, 150)
                    .frame(width: 200, height: 200, alignment:.center)
                    .shadow(radius: 20 )

                Spacer()
                Divider()
                Text(pokemon.name)
                    .font(.largeTitle)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.black)
                    .underline(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, color: Color.red)
                Divider()
                Text("Peso: \(pokemon.weight)")
                    .font(.title2)
                Divider()
                Text("Altura:\(pokemon.height)")
                    .font(.title3)
                Spacer()
     
            }

        }.onAppear { loadData() }
    }

    func loadData() {
        let request = URLRequest(url: pokemonURL)

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                if let response = try? decoder.decode(Pokemon.self, from: data) {
                    DispatchQueue.main.async {
                        self.pokemon = response
                    }
                    return
                }
                else {
                    print("Something went wrong")
                }
            }
        }.resume()
    }
}


//struct PokemonDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        PokemonDetail (pokemonURL: URL(string: "https://pokeapi.co/api/v2/pokemon/5/")!, pokemon: Pokemon(id: 1, name: "", image: <#T##URL#>, weight: <#T##Int#>, height: <#T##Int#>))
//    }
//}
