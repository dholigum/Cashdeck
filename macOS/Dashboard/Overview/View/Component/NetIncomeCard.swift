//
//  NetIncomeCard.swift
//  Cashdeck (iOS)
//
//  Created by Syahrul Apple Developer BINUS on 02/08/21.
//

import SwiftUI

struct NetIncomeCard: View {
    
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
    
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                Text(title)
                    .font(Font.title.weight(.semibold))
                    .padding(.vertical)
                    .foregroundColor(Color("AccentColor2"))
                    .padding(.top, 4)
                    .padding(.leading, 20)
                
                Picker(selection:$durationOptions, label: Text("")){
                    ForEach(duration, id:\.self){
                        Text($0)
                    }
                }
                .pickerStyle(DefaultPickerStyle())
                .frame(width: 100)
                .padding(.leading,250)
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
                                Text("1.000.000")
                                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .top)
                                Text("750.000")
                                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .top)
                                Text("500.000")
                                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .top)
                                Text("250.000")
                                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .top)
                            }
                            .frame(width: 77, height: 175, alignment: .leading)
                            .padding()
                            
                            ForEach(0..<data.count, id: \.self) { i in
                                BarChartCell(
                                    value: normalizedValue(index: i),
                                    barColor: barColor,
                                    labels: "\(horizontalLabels(index: i))",
                                    labelSize: 9)
                                    
                                    .opacity(barIsTouched(index: i) ? 1 : 0.7)
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
                         )}
                         if currentLabel.isEmpty {
//                             Text(legend)
//                                 .bold()
//                                 .foregroundColor(.black)
//                                 .padding(5)
//                                 .background(RoundedRectangle(cornerRadius: 5).foregroundColor(.white).shadow(radius: 3))
                         } else {
//                            VStack{
//                                Text(currentLabel)
//                                    .bold()
//                                    .foregroundColor(.black)
//                                Text(currentValue)
//                                    .bold()
//                                    .foregroundColor(.black)
//                            }
//                            .background(RoundedRectangle(cornerRadius: 5).foregroundColor(.white).shadow(radius: 3))
//                            .animation(.easeIn)
//                            .offset(x: labelOffset(in: geometry.frame(in: .local).width))
//                            .animation(.easeIn)
                         }
                     }
            }
            .padding()
            
            HStack{
                VStack (alignment: .leading, spacing: 1){
                    Text("Total Income")
                    Text("Rp. 1.000.000")
                        .font(Font.custom("SFProDisplay-Bold", size: 20))
                        .foregroundColor(Color("colorUp"))
                    
                }.frame(maxWidth: .infinity)
                VStack (alignment: .leading, spacing: 1){
                    Text("Total Expense")
                    Text("Rp. 400.000")
                        .font(Font.custom("SFProDisplay-Bold", size: 20))
                        .foregroundColor(Color("ExpenseColor"))
                    
                }.frame(maxWidth: .infinity)
                VStack (alignment: .leading, spacing: 1){
                    Text("Total Net Income")
                    Text("Rp. 600.000")
                        .font(Font.custom("SFProDisplay-Bold", size: 20))
                        .foregroundColor(Color("OrangeColor"))
                    
                }.frame(maxWidth: .infinity)
            }
            .padding()
            .frame(maxWidth: 567)
        }
        .frame(width: 567, height: 414)
        .background(Color.white)
        .cornerRadius(16)
        .clipped()
        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 4, x: 2, y: 2)
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
}



struct NetIncomeCard_Previews: PreviewProvider {
    static var previews: some View {
        NetIncomeCard(title: "Daily Net Income", legend: "IDR", barColor: .blue, data: chartDataSet)
        
//        NetIncomeCard()
    }
}
