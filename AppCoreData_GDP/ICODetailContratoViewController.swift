//
//  ICODetailContratoViewController.swift
//  AppCoreData_GDP
//
//  Created by User on 16/2/16.
//  Copyright © 2016 iCologic. All rights reserved.
//

import UIKit
import CoreData

class ICODetailContratoViewController: UIViewController {
    
    
    //MARK: - VARIABLES
    var selectContratoDataBase : Contratos!
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
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Fase 1 -> accedemos al AppDelegate
        let appDelegate : AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        //Fase 2 -> creamos el objeto que nos permitira crear una interfaz con la que podremos acceder a nuestra base de datos
        managedObjectContext = appDelegate.managedObjectContext

        initialSetup()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initialSetup(){
        
        myNumeroFechaLBL.text = selectContratoDataBase.numeroFecha
        myMesFechaLBL.text = selectContratoDataBase.mesFecha
        myNombreYApellidoTF.text = selectContratoDataBase.nombreYApellido
        myNombreEmpresaTF.text = selectContratoDataBase.nombreEmpresa
        myDireccionEmpresaTF.text = selectContratoDataBase.direccionEmpresa
        myDespachoAbogadosTF.text = selectContratoDataBase.despachoAbogados
        myNumeroColegiado1TF.text = selectContratoDataBase.numeroColegiado1
        myNumeroColegiado2TF.text = selectContratoDataBase.numeroColegiado2
        myObservacionesGeneralesTV.text = selectContratoDataBase.observacionesGenerales
        myNumeroCuentaCorrienteTF.text = selectContratoDataBase.numeroCuenta
        myNumeroCajaTF.text = selectContratoDataBase.numeroCaja
        myNombreTitularCuentaTF.text = selectContratoDataBase.nombreTitularCuenta
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Hecho", style: self.editButtonItem().style, target: self, action: "doneButtonPressed")
        
    }
    
    func doneButtonPressed(){

        navigationController?.popViewControllerAnimated(true)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
