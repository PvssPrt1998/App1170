import Foundation
import CoreData


extension GuideTitle {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GuideTitle> {
        return NSFetchRequest<GuideTitle>(entityName: "GuideTitle")
    }

    @NSManaged public var text: String?

}

extension GuideTitle : Identifiable {

}
