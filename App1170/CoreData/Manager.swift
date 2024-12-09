import Foundation

final class Manager {
    private let modelName = "DataModel"
    
    lazy var coreDataStack = CoreDataStack(modelName: modelName)
    
    func saveTime(_ time: Time) {
        let timeCD = TimeCD(context: coreDataStack.managedContext)
        timeCD.uuid = time.uuid
        timeCD.name = time.name
        timeCD.note = time.note
        timeCD.date = time.date
        timeCD.time = time.time
        timeCD.games = time.games
        coreDataStack.saveContext()
    }
    
    func removeTime(_ time: Time) throws {
        let timesCD = try coreDataStack.managedContext.fetch(TimeCD.fetchRequest())
        guard let timeCD = timesCD.first(where: {$0.uuid == time.uuid }) else { return }
        coreDataStack.managedContext.delete(timeCD)
        coreDataStack.saveContext()
    }
    
    func fetchTime() throws -> Array<Time> {
        var array: Array<Time> = []
        let timesCD = try coreDataStack.managedContext.fetch(TimeCD.fetchRequest())
        timesCD.forEach { tcd in
            array.append(Time(uuid: tcd.uuid, name: tcd.name, note: tcd.note, date: tcd.date, time: tcd.time, games: tcd.games))
        }
        return array
    }
    
    func saveSkin(_ skin: Skin) {
        let skinCD = SkinCD(context: coreDataStack.managedContext)
        skinCD.uuid = skin.uuid
        skinCD.name = skin.name
        skinCD.price = skin.price
        skinCD.image = skin.image
        skinCD.tag = skin.tag
        coreDataStack.saveContext()
    }
    func fetchSkins() throws -> Array<Skin> {
        var array: Array<Skin> = []
        let skinsCD = try coreDataStack.managedContext.fetch(SkinCD.fetchRequest())
        skinsCD.forEach { scd in
            array.append(Skin(uuid: scd.uuid, image: scd.image, name: scd.name, price: scd.price, tag: scd.tag))
        }
        return array
    }
    func removeSkin(_ skin: Skin) throws {
        let skinsCD = try coreDataStack.managedContext.fetch(SkinCD.fetchRequest())
        guard let skinCD = skinsCD.first(where: {$0.uuid == skin.uuid }) else { return }
        coreDataStack.managedContext.delete(skinCD)
        coreDataStack.saveContext()
    }
    func editSkin(_ skin: Skin) {
        do {
            let skinsCD = try coreDataStack.managedContext.fetch(SkinCD.fetchRequest())
            skinsCD.forEach { skinCD in
                if skinCD.uuid == skin.uuid {
                    skinCD.image = skin.image
                    skinCD.name = skin.name
                    skinCD.price = skin.price
                    skinCD.tag = skin.tag
                }
            }
            coreDataStack.saveContext()
        } catch let error as NSError {
            print("Unresolved error \(error), \(error.userInfo)")
        }
    }
    func saveOrEdit(_ guide: Guide) {
        do {
            let guides = try coreDataStack.managedContext.fetch(GuideCD.fetchRequest())
            var founded = false
            guides.forEach { gcd in
                if gcd.id == guide.id {
                    founded = true
                    gcd.isFavorite = guide.isFavorite
                    gcd.readed = guide.readed
                }
            }
            if !founded {
                let guideCD = GuideCD(context: coreDataStack.managedContext)
                guideCD.id = Int32(guide.id)
                guideCD.isFavorite = guide.isFavorite
                guideCD.readed = guide.readed
            }
            coreDataStack.saveContext()
        } catch let error as NSError {
            print("Unresolved error \(error), \(error.userInfo)")
        }
    }
    func saveOrEdit(_ guide: Subtletie) {
        do {
            let guides = try coreDataStack.managedContext.fetch(SubtletieCD.fetchRequest())
            var founded = false
            guides.forEach { gcd in
                if gcd.id == guide.id {
                    founded = true
                    gcd.isFavorite = guide.isFavorite
                    gcd.readed = guide.readed
                }
            }
            if !founded {
                let guideCD = SubtletieCD(context: coreDataStack.managedContext)
                guideCD.id = Int32(guide.id)
                guideCD.isFavorite = guide.isFavorite
                guideCD.readed = guide.readed
            }
            coreDataStack.saveContext()
        } catch let error as NSError {
            print("Unresolved error \(error), \(error.userInfo)")
        }
    }
    func saveOrEdit(_ guide: Mistake) {
        do {
            let guides = try coreDataStack.managedContext.fetch(MistakeCD.fetchRequest())
            var founded = false
            guides.forEach { gcd in
                if gcd.id == guide.id {
                    founded = true
                    gcd.isFavorite = guide.isFavorite
                    gcd.readed = guide.readed
                }
            }
            if !founded {
                let guideCD = MistakeCD(context: coreDataStack.managedContext)
                guideCD.id = Int32(guide.id)
                guideCD.isFavorite = guide.isFavorite
                guideCD.readed = guide.readed
            }
            coreDataStack.saveContext()
        } catch let error as NSError {
            print("Unresolved error \(error), \(error.userInfo)")
        }
    }
    
    func fetchGuides() throws -> Array<GuideCD> {
        return try coreDataStack.managedContext.fetch(GuideCD.fetchRequest())
    }
    func fetchMistakes() throws -> Array<MistakeCD> {
        return try coreDataStack.managedContext.fetch(MistakeCD.fetchRequest())
    }
    func fetchSubtleties() throws -> Array<SubtletieCD> {
        return try coreDataStack.managedContext.fetch(SubtletieCD.fetchRequest())
    }
}
