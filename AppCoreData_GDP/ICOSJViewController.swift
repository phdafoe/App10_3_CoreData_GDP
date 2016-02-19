//
//  ICOSJViewController.swift
//  AppCoreData_GDP
//
//  Created by User on 15/2/16.
//  Copyright © 2016 iCologic. All rights reserved.
//

import UIKit

class ICOSJViewController: UIViewController {
    
    //MARK: - IBOUTLET
    @IBOutlet weak var myScrollView: UIScrollView!
    @IBOutlet weak var myPageControl: UIPageControl!
    

    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        for var indice = 0; indice < 11; ++indice{
            
            let imagenes = UIImageView(image: UIImage(named: NSString(format: "AJ_%d.jpg", indice) as String))
            imagenes.frame = CGRectMake(CGFloat(indice - 1) * 524, 0, 524, 331)
            myScrollView.addSubview(imagenes)
        }
        
        
        myScrollView.delegate = self
        myScrollView.contentSize = CGSizeMake(10 * 524, 331)
        myScrollView.pagingEnabled = true
        myPageControl.numberOfPages = 10
        myPageControl.currentPage = 0

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


extension ICOSJViewController : UIScrollViewDelegate{
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        
        let page = CGFloat(myScrollView.contentOffset.x / myScrollView.frame.size.width)
        myPageControl.currentPage = Int(page)
        
    }
    
}
