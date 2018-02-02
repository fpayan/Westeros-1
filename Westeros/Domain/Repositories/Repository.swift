//
//  Repository.swift
//  Westeros
//
//  Created by Alexandre Freire on 31/12/2017.
//  Copyright © 2017 Westeros. All rights reserved.
//

import Foundation

final class Repository {
    static let local = LocalFactory()
}

protocol HouseFactory {
    
    typealias Filter = (House) -> Bool
    
    var houses: [House] { get }
    func house(named: String) -> House?
    func houses(filteredBy: Filter) -> [House]
}

final class LocalFactory: HouseFactory {
    func houses(filteredBy: Filter) -> [House] {
        return Repository.local.houses.filter(filteredBy)
    }
    
    var houses: [House] {
        let houses = remoteHouses()
        return houses.sorted()
        // Houses creation here
//        let starkSigil = Sigil(imageName: "codeIsComing.png", description: "Lobo Huargo")
//        let lannisterSigil = Sigil(imageName: "lannister.jpg", description: "León Rampante")
//        let targaryenSigil = Sigil(imageName: "targaryenSmall.jpg", description: "Dragón tricéfalo")
//
//        let starkURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Stark")!
//        let lannisterURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Lannister")!
//        let targaryenURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Targaryen")!
//
//        let starkHouse = House(name: "Stark", sigil: starkSigil, words: "Se acerca el invierno!", url: starkURL)
//        let lannisterHouse = House(name: "Lannister", sigil: lannisterSigil, words: "Oye mi rugido!", url: lannisterURL)
//        let targaryenHouse = House(name: "Targaryen", sigil: targaryenSigil, words: "Fuego y Sangre", url: targaryenURL)
//
//        let robb = Person(name: "Robb", alias: "El Joven Lobo", house: starkHouse)
//        let arya = Person(name: "Arya", house: starkHouse)
//        let tyrion = Person(name: "Tyrion", alias: "El Enano", house: lannisterHouse)
//        let cersei = Person(name: "Cersei", house: lannisterHouse)
//        let jaime = Person(name: "Jaime", alias: "El matarreyes", house: lannisterHouse)
//        let dani = Person(name: "Daenerys", alias: "Madre de Dragones", house: targaryenHouse)
//
//        // Add characters to houses
//        starkHouse.add(persons: arya, robb)
//        lannisterHouse.add(persons: tyrion, cersei, jaime)
//        targaryenHouse.add(person: dani)
//
//        return [starkHouse, lannisterHouse, targaryenHouse].sorted()
        
    }
    
    func house(named: String) -> House? {
        let house = houses.filter { $0.name.uppercased() == named.uppercased() }.first
        return house
    }
    
    func house(named name: HouseName) -> House? {
        return house(named: name.rawValue)
    }
    
    var seasons: [Season] {
        
        // Date Formatter
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        
        // Creamos las temporadas
        let firstSeason = Season(name: "Season 1", releaseDate: dateFormatter.date(from: "17/04/2011")!)
        let secondSeason = Season(name: "Season 2", releaseDate: dateFormatter.date(from: "01/04/2012")!)
        let thirdSeason = Season(name: "Season 3", releaseDate: dateFormatter.date(from: "31/03/2013")!)
        let fourthSeason = Season(name: "Season 4", releaseDate: dateFormatter.date(from: "06/04/2014")!)
        let fifthSeason = Season(name: "Season 5", releaseDate: dateFormatter.date(from: "12/04/2015")!)
        let sixthSeason = Season(name: "Season 6", releaseDate: dateFormatter.date(from: "24/04/2016")!)
        let seventhSeason = Season(name: "Season 7", releaseDate: dateFormatter.date(from: "16/07/2017")!)
        
        // Creamos los capítulos
        let episode1x01 = Episode(title: "Winter Is Coming", releaseDate: dateFormatter.date(from: "17/04/2011")!, season: firstSeason)
        let episode1x02 = Episode(title: "The Kingsroad", releaseDate: dateFormatter.date(from: "24/04/2011")!, season: firstSeason)
        
        // Los añadimos a la temporada
        firstSeason.add(episodes: episode1x01, episode1x02)
        
        // Creamos los capítulos
        let episode2x01 = Episode(title: "The North Remembers", releaseDate: dateFormatter.date(from: "01/04/2012")!, season: secondSeason)
        let episode2x02 = Episode(title: "The Night Lands", releaseDate: dateFormatter.date(from: "08/04/2012")!, season: secondSeason)
        
        // Los añadimos a la temporada
        secondSeason.add(episodes: episode2x01, episode2x02)
        
        // Creamos los capítulos
        let episode3x01 = Episode(title: "Valar Dohaeris", releaseDate: dateFormatter.date(from: "31/03/2013")!, season: thirdSeason)
        let episode3x02 = Episode(title: "Dark Wings, Dark Words", releaseDate: dateFormatter.date(from: "07/04/2013")!, season: thirdSeason)
        
        // Los añadimos a la temporada
        thirdSeason.add(episodes: episode3x01, episode3x02)
        
        // Creamos los capítulos
        let episode4x01 = Episode(title: "Two Swords", releaseDate: dateFormatter.date(from: "06/04/2014")!, season: fourthSeason)
        let episode4x02 = Episode(title: "The Lion and the Rose", releaseDate: dateFormatter.date(from: "13/04/2014")!, season: fourthSeason)
        
        // Los añadimos a la temporada
        fourthSeason.add(episodes: episode4x01, episode4x02)
        
        
        // Creamos los capítulos
        let episode5x01 = Episode(title: "The Wars to Come", releaseDate: dateFormatter.date(from: "12/04/2015")!, season: fifthSeason)
        let episode5x02 = Episode(title: "The House of Black and White", releaseDate: dateFormatter.date(from: "19/04/2015")!, season: fifthSeason)
        
        // Los añadimos a la temporada
        fifthSeason.add(episodes: episode5x01, episode5x02)
        
        // Creamos los capítulos
        let episode6x01 = Episode(title: "The Red Woman", releaseDate: dateFormatter.date(from: "24/04/2016")!, season: sixthSeason)
        let episode6x02 = Episode(title: "Home", releaseDate: dateFormatter.date(from: "01/05/2016")!, season: sixthSeason)
        
        // Los añadimos a la temporada
        sixthSeason.add(episodes: episode6x01, episode6x02)
        
        // Creamos los capítulos
        let episode7x01 = Episode(title: "Dragonstone", releaseDate: dateFormatter.date(from: "16/07/2017")!, season: seventhSeason)
        let episode7x02 = Episode(title: "Stormborn", releaseDate: dateFormatter.date(from: "23/07/2017")!, season: seventhSeason)
        
        // Los añadimos a la temporada
        seventhSeason.add(episodes: episode7x01, episode7x02)
        
        
        return [
            firstSeason, secondSeason, thirdSeason, fourthSeason,
            fifthSeason, sixthSeason, seventhSeason
        ]
    }
    
}

private extension LocalFactory {
    func houses(fromResource resource: String, withExension ext: String) -> [House] {
        let bundle = Bundle(for: type(of: self))
        if let file = bundle.url(forResource: resource, withExtension: ext) {
            do {
                let data = try Data(contentsOf: file)
                let jsonDecoder = JSONDecoder()
                let houses = try! jsonDecoder.decode([House].self, from: data)
                
                return houses
            } catch {
                return []
            }
        }
        return []
    }
    
    func remoteHouses() -> [House] {
        func house(named name: String, in collection: [House]) -> House {
            return collection.first{ $0.name == name }!
        }
        
        let characters = persons(fromResource: "characters", withExtension: "json")
        var houses = Set<House>()
        characters.forEach { houses.insert($0.house) }
        characters.forEach{
            let h = house(named: $0.house.name, in: Array(houses))
            h.add(person: $0)
        }
        
        return Array(houses)
    }
    func persons(fromResource resource: String, withExtension ext: String) -> [Person]  {
        let bundle = Bundle(for: type(of: self))
        if let file = bundle.url(forResource: resource, withExtension: ext) {
            do {
                let data = try Data(contentsOf: file)
                let jsonDecoder = JSONDecoder()
                let persons = try! jsonDecoder.decode([Person].self, from: data)
                
                return persons
            } catch {
                return []
            }
        }
        return []
    }
}
