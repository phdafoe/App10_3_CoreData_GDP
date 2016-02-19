//
//  Contratos+CoreDataProperties.swift
//  AppCoreData_GDP
//
//  Created by User on 16/2/16.
//  Copyright © 2016 iCologic. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Contratos {

    @NSManaged var numeroFecha: String?
    @NSManaged var mesFecha: String?
    @NSManaged var nombreYApellido: String?
    @NSManaged var nombreEmpresa: String?
    @NSManaged var direccionEmpresa: String?
    @NSManaged var despachoAbogados: String?
    @NSManaged var numeroColegiado1: String?
    @NSManaged var numeroColegiado2: String?
    @NSManaged var observacionesGenerales: String?
    @NSManaged var numeroCuenta: String?
    @NSManaged var numeroCaja: String?
    @NSManaged var nombreTitularCuenta: String?

}
