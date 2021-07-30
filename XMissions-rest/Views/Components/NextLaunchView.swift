//
//  CountDownView.swift
//  XMissions-rest
//
//  Created by Hossein Akbari on 5/3/1400 AP.
//

import SwiftUI

struct NextLaunchView: View {
    let launch: LaunchModel
    let launchTime: LaunchDateModel
    
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
                    TimerView(launchTime: launchTime)
                }
            }
            
        }
    }
    
}

struct TimerView: View {
    var launchTime: LaunchDateModel
    
    var body: some View {
       
        HStack(alignment: .center, spacing: 10) {
            TimerBox(time: launchTime.day, label: "Days")
            TimerBox(time: launchTime.hour, label: "Hours")
            TimerBox(time: launchTime.minute, label: "Minutes")
            TimerBox(time: launchTime.second, label: "Seconds")
        }
        
        .foregroundColor(.white)
        .frame(maxWidth: .infinity)
        .padding([.top, .bottom], 10)
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
        NextLaunchView(launch: LaunchModel(id: "", name: "Mission 1", flight_number: 234, date_utc: "2021-08-29T06:30:00.000Z", success: nil, links: nil, details: "", rocket: "", launchpad: ""), launchTime: LaunchDateModel(day: "00", hour: "00", minute: "00", second: "00"))
            .previewLayout(.sizeThatFits)
            .background(Color("navy-blue"))
    }
}


