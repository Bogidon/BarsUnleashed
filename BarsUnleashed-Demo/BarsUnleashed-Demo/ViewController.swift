//
//  ViewController.swift
//  BarsUnleashed-Demo
//
//  Created by Bogdan Vitoc on 4/18/16.
//  Copyright © 2016 Unleash.me. All rights reserved.
//

import UIKit
import BarsUnleashed

class ViewController: UIViewController {

    @IBOutlet weak var barView: BarView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let data = [BarEntry(value: 20, name: "Angry", color: UIColor.blueColor()),
                    BarEntry(value: 10, name: "Fantastic", color: UIColor.greenColor()),
                    BarEntry(value: 17, name: "Happy", color: UIColor.redColor()),
                    BarEntry(value: 8, name: "Meh...", color: UIColor.purpleColor())]
        barView.setData(data, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

