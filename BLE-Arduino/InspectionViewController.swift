//
//  InspectionViewController.swift
//  BLE-Arduino
//
//  Created by mac on 3.05.2017.
//  Copyright © 2017 test. All rights reserved.
//

import UIKit

class InspectionViewController: UIViewController {
    
    var ble: BLE?
    var infoString: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        
        self.showAnimate()
        
        
        var myStringArr = infoString.components(separatedBy: " ")
        
        if(myStringArr.count > 1){
            leftUS.text = myStringArr [0]
            midUS.text = myStringArr [1]
            rightUS.text = myStringArr [2]
            leftBumper.text = myStringArr [3]
            midBumper.text = myStringArr [4]
            rightBumper.text = myStringArr [5]
            leftIR.text = myStringArr [6]
            midIR.text = myStringArr [7]
            rightIR.text = myStringArr [8]
        }
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var leftUS: UILabel!
    @IBOutlet weak var midUS: UILabel!
    @IBOutlet weak var rightUS: UILabel!
    @IBOutlet weak var leftBumper: UILabel!
    @IBOutlet weak var midBumper: UILabel!
    @IBOutlet weak var rightBumper: UILabel!
    @IBOutlet weak var leftIR: UILabel!
    @IBOutlet weak var midIR: UILabel!
    @IBOutlet weak var rightIR: UILabel!
    
    
    @IBAction func closeInspection(_ sender: Any) {
        self.removeAnimate()
        //self.view.removeFromSuperview()
    }
    
    
    
    
    func showAnimate()
    {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0;
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        });
    }
    
    func removeAnimate()
    {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0;
        }, completion:{(finished : Bool)  in
            if (finished)
            {
                self.view.removeFromSuperview()
            }
        });
    }
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
