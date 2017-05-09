//
//  ViewController.swift
//  BLE-Arduino
//
//  Created by Baris Kuseyri on 12/04/2017.
//  Copyright © 2017 test. All rights reserved.
//

import UIKit

class ViewController: UIViewController, BLEDelegate {
    
    @IBOutlet weak var connstat: UIImageView!
    var bleShield: BLE?
    var timer: Timer?
    var string: String!
    //        var timer2: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        bleShield = BLE()
        bleShield?.delegate = self
        connstat.image = UIImage(named: "disconnectedimage")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "manual"){
            guard let manualViewController = segue.destination as? ManualViewController else { return }
            manualViewController.ble = self.bleShield
        }
        if(segue.identifier == "auto"){
            guard let automaticViewController = segue.destination as? AutomaticViewController else { return }
            automaticViewController.ble = self.bleShield
            }
        if(segue.identifier == "InspectionPopUpID"){
            guard let InspectionViewController = segue.destination as? InspectionViewController else { return }
            InspectionViewController.ble = self.bleShield
            let svc = segue.destination as! InspectionViewController;
            svc.infoString = string
            print("svc.detectedString: \(svc.infoString)")
        }
        }
    
    
    
    func bleDidUpdateState() {
        bleShield?.startScanning(20)
        timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(self.deviceCheck), userInfo: nil, repeats: true)
        timer?.fire()
        print("Wait....")
        
    }
    
    func deviceCheck(){
        print(bleShield?.peripherals)
        if(bleShield!.peripherals.count > 0) {
            bleShield?.connectToPeripheral(bleShield!.peripherals[0])
            timer?.invalidate()
        }
    }
    
    func bleDidConnectToPeripheral() {
        connstat.image = UIImage(named: "connectedimage")
        print("Connected")
        //        timer2 = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(self.sendData), userInfo: nil, repeats: true)
        //        timer2?.fire()
    }
    
    func sendData() {
        print("data sent")
        bleShield!.write(data: "Test".data(using: .utf8)!)
    }
    
    func bleDidDisconenctFromPeripheral() {
        connstat.image = UIImage(named: "disconnectedimage")
        print("Disconnected")
        timer?.fire()
    }
    
    func bleDidReceiveData(_ data: Data?) {
        let string = String(data: data!, encoding: .utf8)
        print(string!)
    }
    
}

