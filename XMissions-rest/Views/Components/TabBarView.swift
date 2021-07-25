//
//  TabBarView.swift
//  XMissions-rest
//
//  Created by Hossein Akbari on 4/6/1400 AP.
//

import SwiftUI

struct TabBarView: View {
    @EnvironmentObject var contentVM: ContentVM
    let tabItems: [TabItemModel] = TabItemModel.items()
    var columns = [GridItem]()
    
    init() {
        for _ in tabItems {
            columns.append(GridItem(.flexible()))
        }
    }
    
    var body: some View {
        VStack(alignment: .center) {
            
            LazyVGrid(columns: columns, alignment: .center, spacing: 10) {
                
                ForEach(tabItems, id:\.tag) { item in
                    VStack(alignment: .center) {
                        Image(uiImage: item.image ?? Tools.defaultImage)
                            .resizable()
                            .frame(width: 25, height: 25, alignment: .center)
                    }
                    .foregroundColor(self.contentVM.tabBarSelection == item.tag ? Color("light-blue") : Color.white)
                    .onTapGesture {
                        self.contentVM.tabBarSelection = item.tag
                    }
                }
            }
            .padding([.top,.bottom], 25)
        }
        .frame(maxWidth: .infinity)
        .background(Color("mid-blue"))
    }
}

extension TabItemModel {
    static func items() -> [TabItemModel] {
        return [
            TabItemModel(image: UIImage(named: "globe-americas"), tag: .home),
            TabItemModel(image: UIImage(named: "history"), tag: .past),
            TabItemModel(image: UIImage(named: "clock"), tag: .upcoming),
            TabItemModel(image: UIImage(named: "industry-alt"), tag: .company)
            
        ]
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
            .previewLayout(.sizeThatFits)
            .environmentObject(ContentVM())
    }
}
