//
//  FactListViewModel.swift
//  ScalePageView
//
//  Created by Ahmet Bostancıklıoğlu on 28.01.2025.
//


import Foundation

class FactListViewModel: ObservableObject {
    @Published var facts:[Fact] = []
    @Published var selectedFactId:UUID?
    func fetch() {
        facts = [
            Fact(title: "Sleeping Otters", imageName: "Otters", photoCredit: "commons.wikimedia.org", caption: "Sea otters hold hands when they sleep to keep from drifting apart"),
            Fact(title: "Smile for the Blind", imageName: "Smile", photoCredit: "Sachiho", caption: "Blind people smile even though they’ve never seen anyone else smile."),
            Fact(title: "Breathing Turtles", imageName: "Turtle", photoCredit: "TaraDSturm", caption: "Turtles can breathe through their butts."),
            Fact(title: "Tree Planters", imageName: "Squirell", photoCredit: "Irene Mei", caption: "Squirrels plant thousands of new trees each year simply by forgetting where they put their acorns."),
            Fact(title: "Chinese Panda", imageName: "Panda", photoCredit: "Cute Baby Animals", caption: "In China, killing a Panda is punishable by death."),
            Fact(title: "Penguin Marriage", imageName: "Penguins", photoCredit:"telegraph.co.uk", caption: "Gentoo penguins propose to their lifemates with a pebble.")
        ]
        selectedFactId = facts[0].id
    }
    
    func selectedFact(id: UUID?) -> Fact? {
        return facts.first(where: {$0.id == id})
    }
}