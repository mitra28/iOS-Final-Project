//
//  ViewController.swift
//  EasyHealth
//
//  Created by Anonya Mitra on 6/27/21.
//

import UIKit
import Charts

class ViewController: UIViewController {

    var greatmood: Int = 0
    
    var alrightmood: Int = 0
    
    var decentmood: Int = 0
    
    var notwellmood: Int = 0
    
    var mooddata: [Int] = []
    
    
    @IBOutlet weak var piechartBox: PieChartView!
    
    @IBOutlet weak var steplinechartBox: LineChartView!
    
    @IBOutlet weak var heartlinechartBox: LineChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let data = [2, 1, 3, 4, 5, 9, 1, 4, 6, 5]
        //mooddata = [greatmood, alrightmood, decentmood, notwellmood]
        graphStepLineChart(dataArray: data)
        graphHeartLineChart(dataArray: data)
        graphMoodPieChart(dataArray: mooddata)
    }
    
    @IBAction func GreatButton(_ sender: Any) {
        greatmood += 1
        mooddata.append(greatmood)
    }
    
    @IBAction func AlrightButton(_ sender: Any) {
        alrightmood += 1
        //mooddata.append(alrightmood)
    }
    
    @IBAction func DecentButton(_ sender: Any) {
        decentmood += 1
        mooddata.append(decentmood)
    }
    
    @IBAction func notwellButton(_ sender: Any) {
        notwellmood += 1
        mooddata.append(notwellmood)
    }
    
    func graphStepLineChart(dataArray: [Int]) {
        //make lineChartBox size have width and height both equal to width of screen
        steplinechartBox.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.width / 2)
        
        //make box center to be horizontally centered but offset towards
        //top of screen
        steplinechartBox.center.x = self.view.center.x
        steplinechartBox.center.y = self.view.center.y //minus move up
        
        //settings when chart has no data
        steplinechartBox.noDataText = "No Data Available"
        steplinechartBox.noDataTextColor = UIColor.black
        
        //initialize array that will eventually be displayed on graph
        var entries = [ChartDataEntry]()
        
        //for each element in given dataset
        //set X and Y coordinates in a data chart entry & add to entries list
        for i in 0..<dataArray.count {
            let value = ChartDataEntry(x: Double(i), y: Double(dataArray[i]))
            entries.append(value)
        }
        
        //use entries object and a label string to make a LineChartDataSet
        //object
        let dataSet = LineChartDataSet(entries: entries, label: "# of Steps")
        
        //customize graph
        dataSet.colors = ChartColorTemplates.colorful()
        
        //make object that will be added to chart and set it to the variable
        //in the Storyboard
        let data = LineChartData(dataSet: dataSet)
        steplinechartBox.data = data
        
        //add settings for the chartbox
        steplinechartBox.chartDescription?.text = "Pi Values"
        
        //setting animations
        steplinechartBox.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .linear)
        
    }
    
    func graphHeartLineChart(dataArray: [Int]) {
        //make lineChartBox size have width and height both equal to width of screen
        heartlinechartBox.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.width / 2)
        
        //make box center to be horizontally centered but offset towards
        //top of screen
        heartlinechartBox.center.x = self.view.center.x
        heartlinechartBox.center.y = self.view.center.y + 240 //minus move up
        
        //settings when chart has no data
        heartlinechartBox.noDataText = "No Data Available"
        heartlinechartBox.noDataTextColor = UIColor.black
        
        //initialize array that will eventually be displayed on graph
        var entries = [ChartDataEntry]()
        
        //for each element in given dataset
        //set X and Y coordinates in a data chart entry & add to entries list
        for i in 0..<dataArray.count {
            let value = ChartDataEntry(x: Double(i), y: Double(dataArray[i]))
            entries.append(value)
        }
        
        //use entries object and a label string to make a LineChartDataSet
        //object
        let dataSet = LineChartDataSet(entries: entries, label: "Heart Rate")
        
        //customize graph
        dataSet.colors = ChartColorTemplates.joyful()
        
        //make object that will be added to chart and set it to the variable
        //in the Storyboard
        let data = LineChartData(dataSet: dataSet)
        heartlinechartBox.data = data
        
        //add settings for the chartbox
        heartlinechartBox.chartDescription?.text = "Pi Values"
        
        //setting animations
        heartlinechartBox.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .linear)
        
    }

    func graphMoodPieChart(dataArray: [Int]) {
        //make lineChartBox size have width and height both equal to width of screen
        piechartBox.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.width / 2)
        
        //make box center to be horizontally centered but offset towards
        //top of screen
        piechartBox.center.x = self.view.center.x + 100
        piechartBox.center.y = self.view.center.y - 240 //minus move up
        
        //settings when chart has no data
        piechartBox.noDataText = "No Data Available"
        piechartBox.noDataTextColor = UIColor.black
        
        //initialize array that will eventually be displayed on graph
        var entries = [ChartDataEntry]()
        
        //for each element in given dataset
        //set X and Y coordinates in a data chart entry & add to entries list
        for i in 0..<dataArray.count {
            let value = ChartDataEntry(x: Double(i), y: Double(dataArray[i]))
            entries.append(value)
        }
        
        //use entries object and a label string to make a LineChartDataSet
        //object
        let dataSet = PieChartDataSet(entries: entries, label: "Mood/Energy")
        
        //customize graph
        dataSet.colors = ChartColorTemplates.liberty()
        
        //make object that will be added to chart and set it to the variable
        //in the Storyboard
        let data = PieChartData(dataSet: dataSet)
        piechartBox.data = data
        
        //add settings for the chartbox
        piechartBox.chartDescription?.text = "Pi Values"
        
        //setting animations
        piechartBox.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .linear)
        
    }

}

