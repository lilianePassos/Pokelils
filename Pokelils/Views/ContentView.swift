import SwiftUI

struct ContentView: View {

    @State var items: [ResultListItem]

    var body: some View {
        NavigationView{
            List(self.items) { item in
                NavigationLink(
                    destination: PokemonDetail(pokemonURL: item.url!)){
                    PokemonRow(pokemonName: item.name)
                }


            }.onAppear { loadData()

            }.navigationBarTitle("Pokemon List", displayMode: .inline)
        }
    }

    func loadData() {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=100") else {
            print("Invalid URL")
            return
        }
        let request = URLRequest(url: url)

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let response = try? JSONDecoder().decode(PokemonList.self, from: data) {
                    DispatchQueue.main.async {
                        self.items = response.results
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(items: [ResultListItem(name: "Teste", url: URL(string: "http://google.com")!)])
    }
}
