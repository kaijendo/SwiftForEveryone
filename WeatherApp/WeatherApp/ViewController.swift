//
//  ViewController.swift
//  WeatherApp
//
//  Created by Thuy Truong Quang on 12/11/17.
//  Copyright © 2017 Thuy Truong Quang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
    /// Variable
    var cache: NSCache<AnyObject, AnyObject>!
    /// Outlets
    @IBOutlet weak var spinner: UIActivityIndicatorView! {
        didSet {
            spinner.startAnimating()
        }
    }
    @IBOutlet weak var statusView: UIView! {
        didSet {
            statusView.isHidden = true
        }
    }
    @IBOutlet weak var myScrollView: UIScrollView!
    @IBOutlet weak var fullView: UIView!
    @IBOutlet weak var miniView: UIView!
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var lblStatus: UILabel! {
        didSet {
            lblStatus.isHidden = true
        }
    }
    @IBOutlet weak var lblTemp: UILabel!
    @IBOutlet weak var imgBackgroundGif: UIImageView!
    
    @IBOutlet weak var tblMainWeather: UITableView! {
        didSet {
            self.tblMainWeather.rowHeight = 45
            self.tblMainWeather.isHidden = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.cache = NSCache()
        DataServices.shared.searchKey = "Thai%20nguyen"
        NotificationCenter.default.addObserver(self, selector: #selector(setupData), name: Notification.Name.GetData().didGetData, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    deinit {
        NotificationCenter.default.removeObserver(self, name: Notification.Name.GetData().didGetData, object: nil)
    }
}
// MARK: - Private Function
extension ViewController {
    @objc
    fileprivate func setupData() {
        //DataServices.shared.weather.forecasts.removeFirst()
        lblLocation.text = DataServices.shared.weather.location?.name
        lblStatus.text = "\(DataServices.shared.weather.current?.condition?.text ?? "NULL")"
        lblTemp.text = "\(Int(DataServices.shared.weather.current?.temp_c ?? 0.0))°"
        tblMainWeather.dataSource = self
        spinner.stopAnimating()
        self.tblMainWeather.isHidden = false
        self.lblStatus.isEnabled = false
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataServices.shared.weather.forecasts.count - 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! DayOfWeekTableViewCell
        let newIndex = IndexPath(row: indexPath.row + 1, section: indexPath.section)
        
        cell.lblDay.text = DataServices.shared.weather.forecasts[newIndex.row].date?.stringdateFromString()
        cell.lblMax.text = "\(DataServices.shared.weather.forecasts[newIndex.row].day.first?.maxtemp_c ?? 0.0)"
        cell.lblMin.text = "\(DataServices.shared.weather.forecasts[newIndex.row].day.first?.mintemp_c ?? 0.0)"
        cell.imgStatus?.downloadAndCacheImage(from: "http:" + (DataServices.shared.weather.forecasts[newIndex.row].day.first?.condition?.icon)!, cache: self.cache!, object: "http:" + (DataServices.shared.weather.forecasts[newIndex.row].day.first?.condition?.icon)! as AnyObject)
        cell.selectionStyle = .none
        return cell
    }
    
    
}





