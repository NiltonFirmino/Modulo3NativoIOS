//
//  UIViewController+Context.swift
//  Modulo3NativoIOS
//
//  Created by NiltonFirmino on 1/8/22.
//

import UIKit
import CoreData

extension UIViewController {
    var context: NSManagedObjectContext{
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
}
