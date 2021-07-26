//
//  CountDownView.swift
//  XMissions-rest
//
//  Created by Hossein Akbari on 5/3/1400 AP.
//

import SwiftUI

struct NextLaunchView: View {
    let launch: LaunchModel
    
    var body: some View {
        VStack {
       
            VStack {
                HeaderLabel(title: "Next Launch")
                
                VStack(spacing: 10) {
                    RowData(label: "Name", value: launch.name ?? "Unkown")
                    if let launchDate = launch.date_utc {
                        RowData(label: "Launch date", value: Date.dateFormatter(time: launchDate))
                    }
                    
                }.blueBox()
                
                if let date = Date.convertStringToDate(time: launch.date_utc ?? ""), date > Date() {
                    TimerView(referenceDate: date)
                }
            }
            
        }
    }
    
}

struct TimerView: View {
    @State private var nowDate: Date = Date()
    @State private var day: String = "00"
    @State private var hour: String = "00"
    @State private var minute: String = "00"
    @State private var second: String = "00"
    @State var referenceDate: Date
    
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    private func countDownString(from date: Date, until nowDate: Date) {
        let calendar = Calendar(identifier: .gregorian)
        let components = calendar.dateComponents([.day, .hour, .minute, .second], from: nowDate, to: date)
    
        self.day = String(format: "%02d", components.day ?? 00)
        self.hour = String(format: "%02d", components.hour ?? 00)
        self.minute = String(format: "%02d", components.minute ?? 00)
        self.second = String(format: "%02d", components.second ?? 00)
    }
    
    var body: some View {
       
        HStack(alignment: .center, spacing: 10) {
            TimerBox(time: self.day, label: "Days")
            TimerBox(time: self.hour, label: "Hours")
            TimerBox(time: self.minute, label: "Minutes")
            TimerBox(time: self.second, label: "Seconds")
        }
        
        .foregroundColor(.white)
        .frame(maxWidth: .infinity)
        .padding([.top, .bottom], 10)
        .onReceive(timer, perform: { _ in
            countDownString(from: referenceDate, until: nowDate)
            referenceDate -= 1
        })
    }
}

struct TimerBox: View {
    let time:  String
    let label: String
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Text(label)
                .foregroundColor(.white)
                .font(.system(size: 14, weight: .bold, design: .rounded))
            
            VStack {
                Text(time)
            }
            .frame(width: 75, height: 70, alignment: .center)
            .font(.system(size: 35, weight: .bold, design: .rounded))
            .background(Color("mid-blue"))
            .cornerRadius(5)
        }
    }
}

struct CountDownView_Previews: PreviewProvider {
    static var previews: some View {
        NextLaunchView(launch: LaunchModel(id: "", name: "Mission 1", flight_number: 234, date_utc: "2021-08-29T06:30:00.000Z", success: nil, links: nil, details: "", rocket: "", launchpad: ""))
            .previewLayout(.sizeThatFits)
            .background(Color("navy-blue"))
    }
}


