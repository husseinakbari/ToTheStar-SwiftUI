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
                
                ForEach(tabItems.indices) { index in
                    VStack(alignment: .center, spacing: 7) {
                        Image(uiImage: tabItems[index].image ?? Tools.defaultImage)
                            .resizable()
                            .frame(width: 25, height: 25, alignment: .center)
                        
                        Text(tabItems[index].label)
                            .font(.yekan(size: 14, weight: .bold))
                    }
                    .foregroundColor(self.contentVM.tabBarSelection == index ? Color("light-blue") : Color.white)
                    .onTapGesture {
                        self.contentVM.tabBarSelection = index
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
            TabItemModel(label: "شرکت", image: UIImage(named: "industry-alt")),
            TabItemModel(label: "خانه", image: UIImage(named: "globe-americas"))
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
