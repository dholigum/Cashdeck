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
    var barLabel: [String] = [
        "Monday",
        "Tuesday",
        "Wednesday",
        "Thursday",
        "Friday",
        "Saturday",
        "Sunday"]
    
    @State private var currentValue = ""
    @State private var currentLabel = ""
    @State private var touchLocation: CGFloat = -1
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text(title)
                .bold()
                .font(.largeTitle)
            Text("Current Value: \(currentValue)")
                .font(.headline)
            
            GeometryReader {
                geometry in
                     VStack {
                         HStack {
                             //Cells
                            ForEach(0..<data.count, id: \.self) { i in
                                BarChartCell(value: normalizedValue(index: i), barColor: barColor, labels: "Day")
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
                            VStack{
                                Text(currentLabel)
                                    .bold()
                                    .foregroundColor(.black)
                                Text(currentValue)
                                    .bold()
                                    .foregroundColor(.black)
                            }
                            .background(RoundedRectangle(cornerRadius: 5).foregroundColor(.white).shadow(radius: 3))
                             .animation(.easeIn)
                           .offset(x: labelOffset(in: geometry.frame(in: .local).width))
                           .animation(.easeIn)
                         }
                     }
            }
            .padding()
        }
        .frame(width: 567, height: 380)
        .background(Color.white)
        .cornerRadius(16)
        .clipped()
        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 4, x: 2, y: 2)
    }
    
    func normalizedValue(index: Int) -> Double {
             var allValues: [Double]    {
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
    
    func barIsTouched(index: Int) -> Bool {
        touchLocation > CGFloat(index)/CGFloat(data.count) && touchLocation < CGFloat(index+1)/CGFloat(data.count)
    }
    
    func updateCurrentValue()    {
             let index = Int(touchLocation * CGFloat(data.count))
             guard index < data.count && index >= 0 else {
                 currentValue = ""
                 currentLabel = ""
                 return
             }
             currentValue = "\(data[index].value)"
             currentLabel = data[index].label
    }
    func resetValues() {
             touchLocation = -1
             currentValue  =  ""
             currentLabel = ""
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
