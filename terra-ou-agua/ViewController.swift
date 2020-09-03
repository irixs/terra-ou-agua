//
//  ViewController.swift
//  terra-ou-agua
//
//  Created by Íris Soares on 02/09/20.
//  Copyright © 2020 Apple Academy UFPE. All rights reserved.
//

import UIKit




class ViewController: UIViewController {
    var onWater = WaterE(query: "", requestId: "", lat: 0.00, lon: 0.00, water: false)
    let baseUrlString = "https://api.onwater.io/api/v1/results/"
    
    @IBAction func dicesButton(_ sender: UIButton) {
        //gerar duas coordenadas aleatorias
        let cordinates = randomCordinates()
        print(cordinates)
        searchLand()
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
    func searchLand() {
        //let coordinates = "79.582, -9.137"
        let UrlString = "\(baseUrlString)79.582,-9.137"
        let Url = URL(string: UrlString)!
        let session = URLSession.shared
        let task = session.dataTask(with: Url) { data, response, error in
            do {
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(WaterElement.self, from: data!)
                
                DispatchQueue.main.async {
                    self.onWater.water = jsonData.water
                    self.onWater.query = jsonData.query
                    self.onWater.requestId = jsonData.requestId
                    self.onWater.lat = jsonData.lat
                    self.onWater.lon = jsonData.lon
                    
                    print(self.onWater.water)
                    print(self.onWater.lat)
                    print(self.onWater.lon)
                    //self.tableView.reloadData()
                }
            } catch {
                print("JSON Error: \(error.localizedDescription)")
                DispatchQueue.main.async {
                 // aqui a gente coloca o caso default pra quando aconteça algum erro
                }
            }
        }
        
        task.resume()
    }

}
