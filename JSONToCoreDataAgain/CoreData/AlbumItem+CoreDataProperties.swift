//
//  AlbumItem+CoreDataProperties.swift
//  JSONToCoreDataAgain
//
//  Created by anoop on 2018-11-27.
//  Copyright © 2018 anoop. All rights reserved.
//
//

import Foundation
import CoreData


extension AlbumItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AlbumItem> {
        return NSFetchRequest<AlbumItem>(entityName: "AlbumItem")
    }

    @NSManaged public var title: String?
    @NSManaged public var artist: String?
    @NSManaged public var url: String?
    @NSManaged public var image: String?
    @NSManaged public var thumbnail_image: String?

}
