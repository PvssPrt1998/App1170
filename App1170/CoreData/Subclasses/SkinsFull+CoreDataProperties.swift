import Foundation
import CoreData


extension SkinsFull {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SkinsFull> {
        return NSFetchRequest<SkinsFull>(entityName: "SkinsFull")
    }

    @NSManaged public var isFull: Bool

}

extension SkinsFull : Identifiable {

}
