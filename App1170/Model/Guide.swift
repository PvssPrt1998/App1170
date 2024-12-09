import Foundation

struct Guide: Hashable {
    let id: Int
    let title: String
    let image1: String
    let image2: String
    let image3: String
    let text1: String
    let text2: String
    let text3: String
    var isFavorite: Bool
    var readed: Bool
}

struct Subtletie: Hashable {
    let id: Int
    let title: String
    let image: String
    let image1: String
    let image2: String
    let image3: String
    let text1: String
    let text2: String
    let text3: String
    var isFavorite: Bool
    var readed: Bool
}

struct Mistake: Hashable {
    let id: Int
    let title: String
    let image: String
    let image1: String
    let image2: String
    let text1: String
    let text2: String
    var isFavorite: Bool
    var readed: Bool
}

struct Time: Hashable {
    let uuid: UUID
    let name: String
    let note: String
    let date: String
    let time: String
    let games: String
}

struct Skin: Hashable {
    let uuid: UUID
    let image: Data
    let name: String
    let price: String
    let tag: String
}
