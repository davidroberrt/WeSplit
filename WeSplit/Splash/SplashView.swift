//
//  SplashView.swift
//  WeSplit
//
//  Created by David Robert on 12/09/24.
//

import SwiftUI

struct SplashView: View {
    @State private var mainView: Bool = false
    var body: some View {
        ZStack{
            if mainView {
                ContentView()
            }
            LinearGradient(colors: [.blue,.black], startPoint: .top, endPoint: .center)
    
            Image("logoWhite")
                .resizable()
                .frame(width: 300,height: 300)
        }.ignoresSafeArea(.all)
    
    }
}

#Preview {
    SplashView()
}
