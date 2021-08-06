//
//  CompanyView.swift
//  XMissions-rest
//
//  Created by Hossein Akbari on 4/6/1400 AP.
//

import SwiftUI

struct CompanyView: View {
    @EnvironmentObject var contentVM: ContentVM
    
    var body: some View {
        let company = self.contentVM.company
        
        NavigationView {
            ZStack {
                Color("navy-blue").edgesIgnoringSafeArea(.all)
                
                if let company = company {
                    
                    ScrollView {
                
                        ImageSliderView(images: Tools.companyImages())
                    
                        VStack(spacing: 20) {
                            VStack(spacing: 10) {
                                Text("Space Exploration Technologies Corporation")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .bold, design: .rounded))
                                
                                Text("Founded in 2002 by Elon musk")
                                    .foregroundColor(Color("light-gray"))
                                    .font(.system(size: 14, weight: .medium, design: .rounded))
                            }.blueBox()
                            
                            VStack(alignment: .leading ,spacing: 10) {

                                RowData(label: "CEO", value: company.ceo)
                                
                                RowData(label: "CTO", value: company.cto)
                    
                                RowData(label: "COO", value: company.coo)
                                
                                RowData(label: "Valuation", value: company.valuation.currencyUS)
                                
                                RowData(label: "Employees", value: "\(company.employees)")
                                
                                if let headquarters = company.headquarters {
                                    RowData(rowType: .multiline, label: "Location", value: "\(headquarters.address), \(headquarters.city), \(headquarters.address)")
                                }
                                
                                BlueBox.divider()
                                
                                if let links = company.links {
                                    if let website = links.website {
                                        RowData(rowType: .link, label: "Website", value: website)
                                    }
                                    if let flickr = links.flickr {
                                        RowData(rowType: .link, label: "Flickr", value: flickr)
                                    }
                                    if let twitter = links.twitter {
                                        RowData(rowType: .link, label: "Twitter", value: twitter)
                                    }
                                    if let elon_twitter = links.elon_twitter {
                                        RowData(rowType: .link, label: "Elon Twitter", value: elon_twitter)
                                    }
                                }
                                
                                
                                if let summery = company.summary {
                                    BlueBox.divider()
                                    Text(summery)
                                        .foregroundColor(Color("light-gray"))
                                        .font(.system(size: 14, weight: .medium, design: .rounded))
                                        .frame(maxWidth: .infinity, alignment: .center)
                                }
                                
                            }.blueBox()
                            
                        }.padding([.all], 15)
                            
                            
                    }
                } else {
                    LoadingIndicator()
                }
                
            }
            .navigationTitle("SpaceX")
        }
    }
}

struct CompanyView_Previews: PreviewProvider {
    static var previews: some View {
        CompanyView()
            .previewDevice("iPhone 12")
            .environmentObject(ContentVM())
    }
}
