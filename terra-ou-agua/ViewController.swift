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
    var caminho = [false,false,false,false,false,false]
    
 @IBAction func showAlertButtonTapped(_ sender: UIButton) {

        // create the alert
        let alert = UIAlertController(title: "My Title", message: "This is my message.", preferredStyle: UIAlertController.Style.alert)

        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func dicesButton(_ sender: UIButton) {
        //gerar duas coordenadas aleatorias
        let cordinates = randomCordinates()
        searchLand(cordinates: cordinates)
        treasurePath(isOnWater: self.onWater.water)
        print(onWater.water)
    }
    
    @IBOutlet weak var caminho1: UIImageView!
    @IBOutlet weak var caminho2: UIImageView!
    @IBOutlet weak var caminho3: UIImageView!
    @IBOutlet weak var caminho4: UIImageView!
    @IBOutlet weak var caminho5: UIImageView!
    @IBOutlet weak var caminho6: UIImageView!
    
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
    func randomCordinates() -> String {
        let latitudeLong = Double.random(in: -90.0...90.0)
        let longitudeLong = Double.random(in: -90.0...90.0)
        
        let latitude = Double(round(1000*latitudeLong)/1000)
        let longitude = Double(round(1000*longitudeLong)/1000)
        
        let lat = String(latitude)
        let lon = String (longitude)
        
        return lat+","+lon
    
    }
    func searchLand(cordinates: String) {

        let UrlString = "\(baseUrlString)"+cordinates
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
                    print("foi")
                }
            } catch {
                print("JSON Error: \(error.localizedDescription)")
                DispatchQueue.main.async {
                 // aqui a gente coloca o caso default pra quando aconteça algum erro
                    self.onWater.water = true
                }
            }
        }
        task.resume()
    }
    func treasurePath(isOnWater: Bool) {
        if isOnWater == true{
            let alert = UIAlertController(title: "Deu Ruim, MArujo!!", message: "Tu vai ter que beber o mar todinhooo", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else if isOnWater == false {
            if caminho[0] == false{
                caminho1.isHidden = false
                caminho[0] = true
                
                let alert = UIAlertController(title: "Deu Sorte, MArujo!!", message: "Voce encontrou terra firme, AVANCE UMA CASA", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            else if caminho[1] == false{
                caminho2.isHidden = false
                caminho[1] = true
                let alert = UIAlertController(title: "FALA MArujo!!", message: "Voce encontrou terra firme, AVANCE UMA CASA", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            else if caminho[2] == false{
                caminho3.isHidden = false
                caminho[2] = true
                let alert = UIAlertController(title: "FALA MArujo!!", message: "Voce encontrou terra firme, AVANCE UMA CASA", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            else if caminho[3] == false{
                caminho4.isHidden = false
                caminho[3] = true
                let alert = UIAlertController(title: "FALA MArujo!!", message: "Voce encontrou terra firme, AVANCE UMA CASA", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            else if caminho[4] == false{
                caminho5.isHidden = false
                caminho[4] = true
                let alert = UIAlertController(title: "FALA MArujo!!", message: "Voce encontrou terra firme, AVANCE UMA CASA", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            else if caminho[5] == false{
                caminho6.isHidden = false
                caminho[5] = true
                let alert = UIAlertController(title: "FALA MArujo!!", message: "TU GANHOU CARAAAIN! Achasse o barriu cheeio de cachaça", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }

        }
    }
}
