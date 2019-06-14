//
//  LandmarkRow.swift
//  SwiftUI_ListNavigation
//
//  Created by zyyk on 2019/6/13.
//  Copyright © 2019 zyyk. All rights reserved.
//

import SwiftUI

struct LandmarkRow : View {
    var landmark: Landmark
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                landmark.image(forSize: 50)
                Text(landmark.name)
                Spacer()
            }
        }
        
    }
}

#if DEBUG
struct LandmarkRow_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            LandmarkRow(landmark: landmarkData[0])
            LandmarkRow(landmark: landmarkData[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
#endif
