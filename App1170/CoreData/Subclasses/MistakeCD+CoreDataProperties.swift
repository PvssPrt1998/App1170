
import Foundation
import CoreData


extension MistakeCD {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MistakeCD> {
        return NSFetchRequest<MistakeCD>(entityName: "MistakeCD")
    }

    @NSManaged public var id: Int32
    @NSManaged public var isFavorite: Bool
    @NSManaged public var readed: Bool

}

extension MistakeCD : Identifiable {

}
