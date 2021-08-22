//
//  HomeAnalyticsCard.swift
//  Cashdeck
//
//  Created by Shiddiq Syuhada on 09/08/21.
//

import SwiftUI

struct HomeAnalyticsCard: View {
    
    var title: String
    var legend: String
    var barColor: Color
    var data: [ChartData]
    let barLabel = [
        "Monday",
        "Tuesday",
        "Wednesday",
        "Thursday",
        "Friday",
        "Saturday",
        "Sunday"]
    let rightLegend = ["1.000.000","750.000","500.000","250.000","0","-250.000","-500.000","-750.000","-1.000.000"]
    
    @State private var currentValue = ""
    @State private var currentLabel = ""
    @State private var currentDay = ""
    @State private var touchLocation: CGFloat = -1
    @State private var phase: CGFloat = 0
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(currentValue)")
                .foregroundColor(Color("AccentColor2"))
                .padding(.leading, 20)
            
            GeometryReader {
                geometry in
                     VStack {
                         HStack {
                             //Cells
                            VStack{
                                ForEach(0..<rightLegend.count, id: \.self){ i in
                                    Text("\(String(format: "%.0f", ChartLegend(index: i)))")
                                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .trailing)
                                }
                            }
                            .frame(width: 77, height: 450, alignment: .leading)
                            .padding()
                            
                            ZStack{
                                VStack{
                                    ForEach(rightLegend, id: \.self){ legend in
                                        Rectangle()
                                            .fill(Color(.gray))
                                            .offset(y: -1.0)
                                            .frame(height: 1)
                                    }.frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxHeight: .infinity, alignment: .center)
                                }
                                .frame(height:450)
                                
                                HStack{
                                    ForEach(0..<data.count, id: \.self) { i in
                                        BarChartCell(
                                            value: normalizedValue(index: i),
                                            barColor: setBarColor(index: i),
                                            labels: "\(horizontalLabels(index: i))",
                                            labelSize: 16)
                                            
                                            .opacity(barIsTouched(index: i) ? 1 : 1)
                                            .scaleEffect(barIsTouched(index: i) ? CGSize(width: 1.05, height: 1) : CGSize(width: 1, height: 1), anchor: .bottom)
                                            .animation(.spring())
                                            .padding(.top)
                                    }
                                    .gesture(DragGesture(minimumDistance: 0)
                                        .onChanged({
                                            position in
                                            let touchPosition = position.location.x/geometry.frame(in: .local).width
                                            touchLocation = touchPosition
                                            updateCurrentValue()
                                        })
                                        .onEnded({
                                            _ in
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                                    withAnimation(Animation.easeOut(duration: 0.5)) {
                                                        resetValues()
                                                    }
                                                }
                                        })
                                    )
                                }
                            
                            }
                         }
                         if currentLabel.isEmpty {
                         } else {
                         }
                     }
            }
            .padding()
            
            HStack(spacing:150){
                VStack (alignment: .leading, spacing: 1){
                    Text("Total Income")
                        .font(Font.custom("SFProDisplay-Regular",size: 18))
                    Text("Rp. 1.000.000")
                        .font(Font.custom("SFProDisplay-Bold", size: 24))
                        .foregroundColor(Color("colorUp"))
                    Text("-Rp. 90.000")
                        .font(Font.custom("SFProDisplay-Regular", size: 14))
                        .foregroundColor(Color("colorDown"))
                    HStack{
                        Text("-10.45%").foregroundColor(Color("colorDown"))
                        Text(" from Yesterday")
                    }.font(Font.custom("SFProDisplay-Regular", size: 14))
                    
                }.frame(minWidth: 200,maxWidth: .infinity)
                VStack (alignment: .leading, spacing: 1){
                    Text("Total Expense")
                        .font(Font.custom("SFProDisplay-Regular",size: 18))
                    Text("Rp. 400.000")
                        .font(Font.custom("SFProDisplay-Bold", size: 24))
                        .foregroundColor(Color("ExpenseColor"))
                    Text("+Rp. 87.000")
                        .font(Font.custom("SFProDisplay-Regular", size: 12))
                        .foregroundColor(Color("colorDown"))
                    HStack{
                        Text("+10.12%").foregroundColor(Color("colorDown"))
                        Text(" from Yesterday")
                    }.font(Font.custom("SFProDisplay-Regular", size: 14))
                }.frame(minWidth: 200,maxWidth: .infinity)
                VStack (alignment: .leading, spacing: 1){
                    Text("Total Net Income")
                        .font(Font.custom("SFProDisplay-Regular",size: 18))
                    Text("Rp. 600.000")
                        .font(Font.custom("SFProDisplay-Bold", size: 24))
                        .foregroundColor(Color("OrangeColor"))
                    Text("+Rp. 121.000")
                        .font(Font.custom("SFProDisplay-Regular", size: 12))
                        .foregroundColor(Color("colorUp"))
                    HStack{
                        Text("+12.12%").foregroundColor(Color("colorUp"))
                        Text(" from Yesterday")
                    }.font(Font.custom("SFProDisplay-Regular", size: 14))
                }.frame(minWidth: 200,maxWidth: .infinity)
            }
            .padding()
            .fixedSize(horizontal: true, vertical: false)
            .frame(width: 1000)
            
        }
    }
    
    func normalizedValue(index: Int) -> Double {
        var allValues: [Double] {
            var values = [Double]()
            for data in data {
                values.append(data.value)
            }
            return values
        }
        guard let max = allValues.max() else {
            return 1
        }
        if max != 0 {
            return Double(data[index].value)/Double(max)
        } else {
            return 1
        }
    }
    
    func horizontalLabels(index: Int) -> String{
        return String(data[index].day)
    }
    
    func barIsTouched(index: Int) -> Bool {
        touchLocation > CGFloat(index)/CGFloat(data.count) && touchLocation < CGFloat(index+1)/CGFloat(data.count)
    }
    
    func updateCurrentValue()    {
             let index = Int(touchLocation * CGFloat(data.count))
             guard index < data.count && index >= 0 else {
                 currentValue = ""
                 currentLabel = ""
                 currentDay = ""
                 return
             }
             currentValue = "Rp. \(data[index].value)"
             currentLabel = data[index].label
             currentDay = data[index].day
    }
    func resetValues() {
             touchLocation = -1
             currentValue  =  ""
             currentLabel = ""
             currentDay = ""
    }
    func labelOffset(in width: CGFloat) -> CGFloat {
             let currentIndex = Int(touchLocation * CGFloat(data.count))
             guard currentIndex < data.count && currentIndex >= 0 else {
                 return 0
             }
             let cellWidth = width / CGFloat(data.count)
             let actualWidth = width -    cellWidth
             let position = cellWidth * CGFloat(currentIndex) - actualWidth/2
             return position
    }
    func setBarColor(index: Int) -> Color {
        if Double(data[index].value) < 0 {
            return Color("colorDown")
        }
        else{
            return Color("AccentColor2")
        }
    }
    func ChartLegend(index: Int) -> Double {
        var AllValues: [Double]{
            var val = [Double]()
            for data in data {
                val.append(data.value)
            }
            return val
        }
        guard let cmax = AllValues.max() else {
            return 1
        }
        let max = ceil(cmax)
        switch index {
        case 0:
            return max
        case 1:
            return max * 0.75
        case 2:
            return max * 0.5
        case 3:
            return max * 0.25
        case 4:
            return 0
        case 5:
            return max * -0.25
        case 6:
            return max * -0.5
        case 7:
            return max * -0.75
        case 8:
            return max * -1
        default:
            return 0
        }
    }
}

struct HomeAnalyticsCard_Previews: PreviewProvider {
    static var previews: some View {
        HomeAnalyticsCard(title: "Daily Net Income", legend: "IDR", barColor: .blue, data: chartDataSet)
    }
}
