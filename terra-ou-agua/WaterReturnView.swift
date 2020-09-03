//
//  Water.swift
//  terra-ou-agua
//
//  Created by Hugo Santos on 03/09/20.
//  Copyright © 2020 Apple Academy UFPE. All rights reserved.
//

import UIKit

class WaterReturnViewController: UITableViewController {

   // var onWater: [WaterE] = []
    var onWater = WaterE(query: "", requestId: "", lat: 0.00, lon: 0.00, water: false)
    let baseUrlString = "https://api.onwater.io/api/v1/results/"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.searchLand()
    }

    
    /// Carrega os dados do webservice  AQUI
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
                    self.tableView.reloadData()
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
    
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return films.count
//    }
    
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "Studio Ghibli Films"
//    }

//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath) as! FilmTableViewCell
//
//        // configura a célula   AQUI
//        let film = films[indexPath.row]
//        cell.textLabel?.text = film.title
//
//        return cell
//    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "showFilm", case let nextVC = segue.destination as? FilmViewController {
//            nextVC?.film = films[tableView.indexPathForSelectedRow!.row]
//        }
//    }
}

