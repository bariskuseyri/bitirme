//
//  AutomaticViewController.swift
//  BLE-Arduino
//
//  Created by Baris Kuseyri on 12/04/2017.
//  Copyright © 2017 test. All rights reserved.
//

import UIKit

class AutomaticViewController: UIViewController {
    
    var ble: BLE?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func randC(_ sender: Any) {
        print("randC")
        ble!.write(data: "R".data(using: .utf8)!)
    }
    
    @IBAction func smartC(_ sender: Any) {
        print("smartC")
        ble!.write(data: "s".data(using: .utf8)!)
    }

    @IBAction func retB(_ sender: Any) {
        print("retB")
        ble!.write(data: "b".data(using: .utf8)!)
    }
    @IBAction func showInspection(_ sender: Any) {
        let popoverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "InspectionPopUpID") as! InspectionViewController
        self.addChildViewController(popoverVC)
        popoverVC.view.frame = self.view.frame
        self.view.addSubview(popoverVC.view)
        popoverVC.didMove(toParentViewController: self)
    }
}
