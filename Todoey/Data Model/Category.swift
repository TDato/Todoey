//
//  Category.swift
//  Todoey
//
//  Created by Thomas Dato on 3/11/20.
//  Copyright © 2020 Tommy Dato. All rights reserved.
//

import Foundation
import RealmSwift

class Category : Object {
    @objc dynamic var name: String = ""
    @objc dynamic var color: String = ""
    let items = List<Item>()
}
