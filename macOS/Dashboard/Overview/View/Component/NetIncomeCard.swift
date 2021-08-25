//
//  NetIncomeCard.swift
//  Cashdeck (iOS)
//
//  Created by Syahrul Apple Developer BINUS on 02/08/21.
//

import SwiftUI

struct NetIncomeCard: View {
    
    let businessUpdateVM = BusinessUpdateViewModel.shared
    
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
    
    @State private var currentValue = ""
    @State private var currentLabel = ""
    @State private var currentDay = ""
    @State private var touchLocation: CGFloat = -1
    
    @State private var durationOptions = "Income"
    var duration = ["Daily","Weekly","Monthly","Yearly"]
    let rightLegend = ["1.000.000","750.000","500.000","250.000","0","-250.000","-500.000","-750.000","-1.000.000"]
    
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                Text(title)
                    .font(Font.title.weight(.semibold))
                    .padding(.vertical)
                    .foregroundColor(Color("AccentColor2"))
                    .padding(.top, 4)
                    .padding(.leading, 20)
            }
            
            
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
                                        .font(Font.custom("SFProDisplay", size: 14))
                                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .trailing)
                                }
                            }
                            .frame(width: 77, height: 175, alignment: .leading)
                            .padding()
                            
                            ZStack{
                                VStack{
                                    ForEach(rightLegend, id: \.self){ legend in
                                        Rectangle()
                                            .fill(Color(.gray))
                                            .offset(y: 2.0)
                                            .frame(height: 1)
                                    }.frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxHeight: .infinity, alignment: .center)
                                }
                                .frame(height:175)
                                
                                HStack{
                                    ForEach(0..<data.count, id: \.self) { i in
                                        BarChartCell(
                                            value: normalizedValue(index: i),
                                            barColor: barColor,
                                            labels: "\(horizontalLabels(index: i))",
                                            labelSize: 9)
                                            
                                            .opacity(barIsTouched(index: i) ? 1 : 1)
                                            .scaleEffect(barIsTouched(index: i) ? CGSize(width: 1.05, height: 1) : CGSize(width: 1, height: 1), anchor: .bottom)
                                            .animation(.spring())
                                            .padding(.top)
                                            .onTapGesture {
                                                print("\(i) tapped")
                                                tappedValue(index: i)
                                            }
                                    }
//                                    .gesture(DragGesture(minimumDistance: 0)
//                                                .onChanged({
//                                                    position in
//                                                    let touchPosition = position.location.x/geometry.frame(in: .local).width
//                                                    touchLocation = touchPosition
//                                                    updateCurrentValue()
//                                                })
//                                                .onEnded({
//                                                    _ in
//                                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//                                                            withAnimation(Animation.easeOut(duration: 0.5)) {
//                                                                resetValues()
//                                                            }
//                                                        }
//                                                })
//                                 )
                                }
                            }
                            }
                         if currentLabel.isEmpty {
                         } else {
                         }
                     }
            }
            .padding()
            
            HStack{
                VStack (alignment: .leading, spacing: 1){
                    Text("Total Income")
                    Text(String(businessUpdateVM.getTodayIncomeExpenseNetIncome()["income"] ?? 0).currencyFormatting())
                        .font(Font.custom("SFProDisplay-Bold", size: 20))
                        .foregroundColor(.black)
                    
                }.frame(maxWidth: .infinity)
                VStack (alignment: .leading, spacing: 1){
                    Text("Total Expense")
                    Text(String(businessUpdateVM.getTodayIncomeExpenseNetIncome()["expense"] ?? 0).currencyFormatting())
                        .font(Font.custom("SFProDisplay-Bold", size: 20))
                        .foregroundColor(.black)
                    
                }.frame(maxWidth: .infinity)
                VStack (alignment: .leading, spacing: 1){
                    Text("Total Net Income")
                    Text(String(businessUpdateVM.getTodayIncomeExpenseNetIncome()["netIncome"] ?? 0).currencyFormatting())
                        .font(Font.custom("SFProDisplay-Bold", size: 20))
                        .foregroundColor(.black)
                    
                }.frame(maxWidth: .infinity)
            }
            .padding()
        }
        .frame(width: 567)
        .background(Color.white)
        .cornerRadius(16)
        .clipped()
        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 4, x: 2, y: 2)
    }
    func tappedValue(index: Int) {
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



struct NetIncomeCard_Previews: PreviewProvider {
    static var previews: some View {
        NetIncomeCard(title: "Daily Net Income", legend: "IDR", barColor: .blue, data: chartDataSet)
        
//        NetIncomeCard()
    }
}
