//
//  ContentView.swift
//  TestBuildEnvironmentApp
//
//  Created by ebpearls on 08/08/2023.
//

import SwiftUI

struct ContentView: View {
    @State var isTapped: Bool = false
    @State var title: String = "Tap me"
    @State var backgroundColor: Color = .gray
    
    var body: some View {
        ZStack {
            Color(.systemBlue)
                .ignoresSafeArea(.all, edges: .all)
                Button {
                    isTapped.toggle()
                    if isTapped {
                        print("Api key is", DemoEnvironment.apiKey)
                        title = "Api key = \(DemoEnvironment.apiKey)"
                        backgroundColor = .red
                    } else {
                        title = "Tap Me!!!"
                        backgroundColor = .gray
                        print ("Tap the button!")
                    }
                } label: {
                    Text(title)
                }
                .frame(width: 300, height: 30, alignment: .center)
                .foregroundColor(.black)
                .background(backgroundColor)
                .cornerRadius(10)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
