
import Foundation
import CoreData


extension GuideCD {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GuideCD> {
        return NSFetchRequest<GuideCD>(entityName: "GuideCD")
    }

    @NSManaged public var id: Int32
    @NSManaged public var isFavorite: Bool
    @NSManaged public var readed: Bool

}

extension GuideCD : Identifiable {

}
