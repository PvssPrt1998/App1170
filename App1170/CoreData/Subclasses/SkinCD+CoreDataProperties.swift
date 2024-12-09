
import Foundation
import CoreData


extension SkinCD {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SkinCD> {
        return NSFetchRequest<SkinCD>(entityName: "SkinCD")
    }

    @NSManaged public var uuid: UUID
    @NSManaged public var image: Data
    @NSManaged public var name: String
    @NSManaged public var price: String
    @NSManaged public var tag: String

}

extension SkinCD : Identifiable {

}
