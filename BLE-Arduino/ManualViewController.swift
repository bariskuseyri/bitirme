//
//  ManualViewController.swift
//  BLE-Arduino
//
//  Created by Baris Kuseyri on 12/04/2017.
//  Copyright © 2017 test. All rights reserved.
//

import UIKit

class ManualViewController: UIViewController {
    
    
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var upButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var downButton: UIButton!
    
    var ble: BLE?
    var timer: Timer!
    var sender: AnyObject?

    override func viewDidLoad() {
        super.viewDidLoad()
        leftButton.addTarget(self, action: #selector(buttonDown), for: .touchDown)
        leftButton.addTarget(self, action: #selector(buttonUp), for: [.touchUpInside, .touchUpOutside])
        upButton.addTarget(self, action: #selector(buttonDown), for: .touchDown)
        upButton.addTarget(self, action: #selector(buttonUp), for: [.touchUpInside, .touchUpOutside])
        rightButton.addTarget(self, action: #selector(buttonDown), for: .touchDown)
        rightButton.addTarget(self, action: #selector(buttonUp), for: [.touchUpInside, .touchUpOutside])
        downButton.addTarget(self, action: #selector(buttonDown), for: .touchDown)
        downButton.addTarget(self, action: #selector(buttonUp), for: [.touchUpInside, .touchUpOutside])
        // Do any additional setup after loading the view.
    }
    
    func buttonDown(sender: AnyObject) {
        self.sender = sender
        singleFire()
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(singleFire), userInfo: nil, repeats: true)
    }
    
    func buttonUp(sender: AnyObject) {
        timer.invalidate()
        ble!.write(data: "x".data(using: .utf8)!)
        print("x")
    }
    
    func singleFire() {
        switch self.sender as! NSObject {
        case leftButton:
            ble!.write(data: "l".data(using: .utf8)!)
        case rightButton:
            ble!.write(data: "r".data(using: .utf8)!)
        case upButton:
            ble!.write(data: "u".data(using: .utf8)!)
        case downButton:
            ble!.write(data: "d".data(using: .utf8)!)
        default:
            print("Unknown Button")
        }
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
    
    
}
