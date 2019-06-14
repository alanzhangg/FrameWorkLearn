//
//  ContentView.swift
//  SwiftUI_Essentials
//
//  Created by zyyk on 2019/6/10.
//  Copyright © 2019 zyyk. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    var body: some View {
        Text("Hello World")
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
