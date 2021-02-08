import Foundation

struct PokemonList: Codable {
    var count: Int
    var next: URL?
    var previous: URL?
    var results: [ResultListItem]
}

struct Pokemon: Codable {
    var id: Int
    var name: String
    var weight: Int
    var height: Int
    var sprites: Sprites
}

struct Sprites: Codable {
    var frontDefault: URL
}
struct ResultListItem: Codable, Identifiable  {
    var id = UUID()
    var name: String
    var url: URL?


    enum CodingKeys: String, CodingKey {
        case name
        case url
    }

    init(name: String, url: URL?) {
        self.name = name
        self.url = url
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decode(String.self, forKey: .name)
        url = try? values.decode(URL.self, forKey: .url)
    }
}
