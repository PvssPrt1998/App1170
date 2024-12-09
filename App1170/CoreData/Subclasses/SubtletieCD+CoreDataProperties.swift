import Foundation
import CoreData


extension SubtletieCD {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SubtletieCD> {
        return NSFetchRequest<SubtletieCD>(entityName: "SubtletieCD")
    }

    @NSManaged public var id: Int32
    @NSManaged public var isFavorite: Bool
    @NSManaged public var readed: Bool

}

extension SubtletieCD : Identifiable {

}
