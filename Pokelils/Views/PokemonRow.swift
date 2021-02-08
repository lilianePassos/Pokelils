import SwiftUI

struct PokemonRow: View {
    var pokemonName: String

    var body: some View {
        HStack {
            Text(pokemonName)
                .font(.headline)
                .foregroundColor(.black)
            Spacer()
        }
    }
}
    struct PokemonRow_Previews: PreviewProvider {
        static var previews: some View {
            PokemonRow (pokemonName:"hahaha")
        }
    }

