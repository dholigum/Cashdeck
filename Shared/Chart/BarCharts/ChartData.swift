//
//  ChartData.swift
//  Cashdeck
//
//  Created by Shiddiq Syuhada on 05/08/21.
//

import Foundation

struct ChartData {
    var label: String
    var value: Double
    var day: String
}

let chartDataSet =
[
    ChartData(label: "January 2021", value: 1000000, day: "Monday"),
    ChartData(label: "February 2021", value: 750000, day: "Tuesday"),
    ChartData(label: "March 2021", value: 500000, day: "Wednesday"),
    ChartData(label: "April 2021", value: 250000, day: "Thursday"),
    ChartData(label: "May 2021", value: 1500000, day: "Friday"),
    ChartData(label: "June 2021", value: -500000, day: "Saturday"),
    ChartData(label: "July 2021", value: -1000000, day: "Sunday")
]

let expensesDataSet = [
    ChartData(label: "January 2021", value: -640.32, day: "Monday"),
    ChartData(label: "February 2021", value: 150.0, day: "Tuesday"),
    ChartData(label: "March 2021", value: 930.22, day: "Wednesday"),
    ChartData(label: "April 2021", value: 350.0, day: "Thursday"),
    ChartData(label: "May 2021", value: 550.0, day: "Friday"),
    ChartData(label: "June 2021", value: 980.0, day: "Saturday"),
    ChartData(label: "July 2021", value: 100.98, day: "Sunday")
]

let netIncomeDataSet = [
    ChartData(label: "January 2021", value: 940.32, day: "Monday"),
    ChartData(label: "February 2021", value: 450.0, day: "Tuesday"),
    ChartData(label: "March 2021", value: 130.22, day: "Wednesday"),
    ChartData(label: "April 2021", value: 850.0, day: "Thursday"),
    ChartData(label: "May 2021", value: 150.0, day: "Friday"),
    ChartData(label: "June 2021", value: 1080.0, day: "Saturday"),
    ChartData(label: "July 2021", value: -50.98, day: "Sunday")
]
