
import Foundation
import CoreData


extension TimeCD {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TimeCD> {
        return NSFetchRequest<TimeCD>(entityName: "TimeCD")
    }

    @NSManaged public var uuid: UUID
    @NSManaged public var name: String
    @NSManaged public var note: String
    @NSManaged public var date: String
    @NSManaged public var time: String
    @NSManaged public var games: String

}

extension TimeCD : Identifiable {

}
