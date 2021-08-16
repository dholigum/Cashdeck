//
//  ExpenseChartData.swift
//  Cashdeck
//
//  Created by Syahrul Apple Developer BINUS on 16/08/21.
//

import Foundation

struct ExpenseChartData {
    var label: String
    var value: Double
    var description: String
}

let expenseChartDataSet = [
    ExpenseChartData(label: "January 2021", value: 50.0, description: "Monday"),
    ExpenseChartData(label: "February 2021", value: 150.0, description: "Tuesday"),
    ExpenseChartData(label: "March 2021", value: 630.22, description: "Wednesday"),
    ExpenseChartData(label: "April 2021", value: 250.0, description: "Thursday"),
    ExpenseChartData(label: "May 2021", value: 150.0, description: "Friday"),
    ExpenseChartData(label: "June 2021", value: 880.0, description: "Saturday"),
    ExpenseChartData(label: "July 2021", value: 300.98, description: "Sunday")
]
