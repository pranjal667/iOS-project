//
//  NoItemView.swift
//  ToDoList
//
//  Created by pranjal on 03/08/2023.
//

import SwiftUI

struct NoItemView: View {
    // MARK: - properties
    @State var animate: Bool = false

    // MARK: - body
    var body: some View {
        VStack(spacing: 20) {
            Text("No items in the List!!!")
                .font(.title)
                .fontWeight(.semibold)
            
            Text("Press the \"Add an Item\" buttton to be more productive💰")
            
            NavigationLink(destination: AddItemView(),
                           label: {
                Text("Add an Item 🥳")
                    .frame(height: 60)
                    .frame(maxWidth: .infinity)
                    .font(.title3)
                    .background(animate ? Color(.systemBlue) : Color(.systemRed))
                    .foregroundColor(.white)
                    .cornerRadius(25)
                    .shadow(color: animate ? Color(.systemBlue) : Color(.systemRed) , radius: 20, y : 15)
            })
            .padding(.horizontal, animate ? 30 : 50)
            .scaleEffect(animate ? 1.1 : 1.0 )
            .offset(y: animate ? 10 : 20 )
            
        }
        .multilineTextAlignment(.center)
        .padding(40)
        .onAppear(perform: addAnimation)
    }
    
    // MARK: - addAnimation
    private func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            withAnimation(
                Animation
                    .easeInOut(duration: 1.5)
                    .repeatForever(autoreverses: true)
            ) {
                animate.toggle()
            }
        }
    }
}

struct NoItemView_Previews: PreviewProvider {
    // MARK: - previews
    static var previews: some View {
        NoItemView()
    }
}
