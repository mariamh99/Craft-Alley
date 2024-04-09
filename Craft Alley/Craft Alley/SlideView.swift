//
//  SlideView.swift
//  Craft Alley
//
//  Created by Mariam Hussein on 7/7/23.
//

import SwiftUI

struct SlideView: View {
    @State private var isMenuOpen = false
    var loggedInUserFirstName: String
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Main content
                LandingView()
                
                // Slide menu
                if isMenuOpen {
                    Rectangle()
                        .foregroundColor(Color(white: 0.3))
                        .opacity(0.5)
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                            withAnimation {
                                isMenuOpen.toggle()
                            }
                        }
                    
                    MenuView(isMenuOpen: $isMenuOpen, loggedInUserFirstName: loggedInUserFirstName)
                        //.frame(width: geometry.size.width * 0.7)
                        .transition(.move(edge: .leading))
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    if value.startLocation.x > geometry.size.width - 100 && value.translation.width < -100 {
                                        withAnimation {
                                            isMenuOpen = false
                                        }
                                    }
                                }
                        )
                }
            }
            .gesture(
                DragGesture()
                    .onChanged { value in
                        if value.startLocation.x < 100 && value.translation.width > 100 {
                            withAnimation {
                                isMenuOpen = true
                            }
                        }
                    }
            )
        }
    }
}

struct SlideView_Previews: PreviewProvider {
    static var previews: some View {
        SlideView(loggedInUserFirstName: "mars")
    }
}
