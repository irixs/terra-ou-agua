//
//  ViewController.swift
//  terra-ou-agua
//
//  Created by Íris Soares on 02/09/20.
//  Copyright © 2020 Apple Academy UFPE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func dicesButton(_ sender: UIButton) {
        //gerar duas coordenadas aleatorias
        let cordinates = randomCordinates()
        print(cordinates)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let value = UIInterfaceOrientation.landscapeRight.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
    }
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscapeRight
    }
    override var shouldAutorotate: Bool {
        return true
    }
    func randomCordinates () -> [Double] {
        let latitudeLong = Double.random(in: -90.0...90.0)
        let longitudeLong = Double.random(in: -90.0...90.0)
        
        let latitude = Double(round(1000*latitudeLong)/1000)
        let longitude = Double(round(1000*longitudeLong)/1000)
        
        return [latitude,longitude]
    }

}
