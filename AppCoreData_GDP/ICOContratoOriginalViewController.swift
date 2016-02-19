//
//  ICOContratoOriginalViewController.swift
//  AppCoreData_GDP
//
//  Created by User on 16/2/16.
//  Copyright © 2016 iCologic. All rights reserved.
//

import UIKit
import CoreData



class ICOContratoOriginalViewController: UIViewController {
    

    //MARK: - VARIABLES LOCALES
    var managedObjectContext = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
    
    
    
    //MARK: - IBOUTLET
    
    @IBOutlet weak var myNumeroFechaLBL: UITextField!
    @IBOutlet weak var myMesFechaLBL: UITextField!
    @IBOutlet weak var myNombreYApellidoTF: UITextField!
    @IBOutlet weak var myNombreEmpresaTF: UITextField!
    @IBOutlet weak var myDireccionEmpresaTF: UITextField!
    @IBOutlet weak var myDespachoAbogadosTF: UITextField!
    @IBOutlet weak var myNumeroColegiado1TF: UITextField!
    @IBOutlet weak var myNumeroColegiado2TF: UITextField!
    @IBOutlet weak var myObservacionesGeneralesTV: UITextView!
    @IBOutlet weak var myNumeroCuentaCorrienteTF: UITextField!
    @IBOutlet weak var myNumeroCajaTF: UITextField!
    @IBOutlet weak var myNombreTitularCuentaTF: UITextField!
    
    
    
    @IBAction func salvarDatosCoreDataACTION(sender: AnyObject) {
        
        //Creamos una entrada general a la base de datos
        let newData = NSEntityDescription.insertNewObjectForEntityForName("Contratos",
            inManagedObjectContext: managedObjectContext) as! Contratos
        
        //Alimentamos la base de datos
        newData.setValue(myNumeroFechaLBL.text, forKey: "numeroFecha")
        newData.setValue(myMesFechaLBL.text, forKey: "mesFecha")
        newData.setValue(myNombreYApellidoTF.text, forKey: "nombreYApellido")
        newData.setValue(myNombreEmpresaTF.text, forKey: "nombreEmpresa")
        newData.setValue(myDireccionEmpresaTF.text, forKey: "direccionEmpresa")
        newData.setValue(myDespachoAbogadosTF.text, forKey: "despachoAbogados")
        newData.setValue(myNumeroColegiado1TF.text, forKey: "numeroColegiado1")
        newData.setValue(myNumeroColegiado2TF.text, forKey: "numeroColegiado2")
        newData.setValue(myObservacionesGeneralesTV.text, forKey: "observacionesGenerales")
        newData.setValue(myNumeroCuentaCorrienteTF.text, forKey: "numeroCuenta")
        newData.setValue(myNumeroCajaTF.text, forKey: "numeroCaja")
        newData.setValue(myNombreTitularCuentaTF.text, forKey: "nombreTitularCuenta")
        
        
        
        
        _ = try? managedObjectContext.save()
        
        
        myNumeroFechaLBL.text = ""
        myMesFechaLBL.text = ""
        myNombreYApellidoTF.text = ""
        myNombreEmpresaTF.text = ""
        myDireccionEmpresaTF.text = ""
        myDespachoAbogadosTF.text = ""
        myNumeroColegiado1TF.text = ""
        myNumeroColegiado2TF.text = ""
        myObservacionesGeneralesTV.text = ""
        myNumeroCuentaCorrienteTF.text = ""
        myNumeroCajaTF.text = ""
        myNombreTitularCuentaTF.text = ""
        
        print(newData)
  
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Fase 1 -> accedemos al AppDelegate
        let appDelegate : AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        //Fase 2 -> creamos el objeto que nos permitira crear una interfaz con la que podremos acceder a nuestra base de datos
        managedObjectContext = appDelegate.managedObjectContext

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
