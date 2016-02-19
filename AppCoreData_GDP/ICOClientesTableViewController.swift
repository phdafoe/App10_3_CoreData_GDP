//
//  ICOClientesTableViewController.swift
//  AppCoreData_GDP
//
//  Created by User on 16/2/16.
//  Copyright © 2016 iCologic. All rights reserved.
//

import UIKit
import CoreData

class ICOClientesTableViewController: UITableViewController {
    
    var fetchContratosArray = []
    var managedObjectContext = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)


    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Fase 1 -> accedemos al AppDelegate
        let appDelegate : AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        //Fase 2 -> creamos el objeto que nos permitira crear una interfaz con la que podremos acceder a nuestra base de datos
        managedObjectContext = appDelegate.managedObjectContext
        
        fetchContratosArray = appDelegate.getAllDataContratos()
    
        //fetchExistContratosData()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: self.editButtonItem().style, target: self, action: "editButtonPressed")

  
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        //fetchExistContratosData()
 
        tableView.reloadData()
    }
    
    
    /*func fetchExistContratosData(){
        
        let fetchRequest = NSFetchRequest(entityName: "Contratos")
        //let resultRquestOfDataBase = try? managedObjectContext.executeFetchRequest(fetchRequest)
        //print(resultRquestOfDataBase)
        if let resutadoRequestOfDataBase = try? managedObjectContext.executeFetchRequest(fetchRequest) where resutadoRequestOfDataBase.count > 0{
            
            for resultado in resutadoRequestOfDataBase{
                //print("Nombre: \(resultado.valueForKey("numeroFecha")!)")
                fetchContratosArray =
                
            }
            
        }else{
            
            print("no hay resultado")
        }
        
        
    }*/
    
    //MARK: - UTILS
    func editButtonPressed(){
        
        tableView.editing = !self.tableView.editing
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //return fetchedContratosArray.count
        return fetchContratosArray.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)

        // Configure the cell...
        
        let contratos : Contratos = fetchContratosArray[indexPath.row] as! Contratos
        cell.textLabel?.text = NSString(format: "Nombre Cliente: %@ Empresa: %@ ", contratos.nombreYApellido!, contratos.nombreEmpresa!) as String
        cell.detailTextLabel?.text = NSString(format: "Fecha: %@ de %@ - 2016", contratos.numeroFecha!, contratos.mesFecha!) as String
        
        //cell.textLabel?.text = "Andres"

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let iCoDetailViewControllerVC : ICODetailContratoViewController = self.storyboard?.instantiateViewControllerWithIdentifier("icoDetailContratos") as! ICODetailContratoViewController
        
        iCoDetailViewControllerVC.selectContratoDataBase = fetchContratosArray.objectAtIndex(indexPath.row) as! Contratos
        
        self.navigationController?.pushViewController(iCoDetailViewControllerVC, animated: true)
        
        
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */


    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            

            

        }
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
