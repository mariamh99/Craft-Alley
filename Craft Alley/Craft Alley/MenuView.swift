//
//  MenuView.swift
//  Craft Alley
//
//  Created by Mariam Hussein on 7/7/23.
//

import SwiftUI

struct MenuView: View {
    @Binding var isMenuOpen: Bool
    @State var loggedInUserFirstName: String
    
    init(isMenuOpen: Binding<Bool>, loggedInUserFirstName: String) { // Add loggedInUserFirstName parameter
            _isMenuOpen = isMenuOpen
            _loggedInUserFirstName = State(initialValue: loggedInUserFirstName) // Assign the value to @State
    }

    var body: some View {
        //title vstack
        ZStack{
            VStack{
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(maxWidth: .infinity , maxHeight: 352)
                    .background(Color("lilac"))
                    .cornerRadius(21)
            }.offset(y: -255)
            
            VStack {
                ZStack {
                    Image("star accents")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxHeight: .infinity)
                    
                    HStack {
                        Spacer()
                        Image(systemName: "chevron.left.2")
                            .bold()
                            .foregroundColor(Color("dark pink"))
                            .font(.system(size: 30))
                            .padding(.trailing)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                    
                    
                    Text("hello \n\(loggedInUserFirstName).")
                        .font(.custom("MilkAndHoney-Regular", size: 50))
                        .foregroundColor(Color("dark pink"))
                        .padding(50)
                        .offset(y: 50)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                }
            
               
   
                VStack (alignment: .leading){
                    HStack {
                        Image(systemName: "lock").bold()
                        .foregroundColor(Color("dark pink"))
                        .font(.system(size: 30))
                        .imageScale(.large)
                        
                        Button {
                        }
                    label: {
                        NavigationLink(destination: ForgotPasswordView()) {
                            Text("Reset Password").bold()
                        }}.foregroundColor(Color("dark pink"))
                            .font(.system(size: 30))
                    }.padding()
                    HStack {
                        Image(systemName: "wrench.adjustable").bold()
                        .foregroundColor(Color("dark pink"))
                        .font(.system(size: 30))
                        .imageScale(.large)
                        
                        Button {
                        }
                    label: {
                        NavigationLink(destination: EditAccountView()) {
                            Text("Edit Account").bold()
                        }}.foregroundColor(Color("dark pink"))
                            .font(.system(size: 30))
                    }.padding()
                    HStack {
                        Image(systemName: "power").bold()
                        .foregroundColor(Color("dark pink"))
                        .font(.system(size: 30))
                        .imageScale(.large)
                        
                        Button {
                        }
                    label: {
                        NavigationLink(destination: LoginView().navigationBarBackButtonHidden(true)) {
                            Text("Log Out").bold()
                        }}.foregroundColor(Color("dark pink"))
                            .font(.system(size: 30))
                    }.padding()
                    
                }.padding(.bottom, 90)
                .padding(.top, 50)
            }
            
        }.background(Color("light pink"))
 
    }
}


struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(isMenuOpen: .constant(true), loggedInUserFirstName: "mars")
    }
}
