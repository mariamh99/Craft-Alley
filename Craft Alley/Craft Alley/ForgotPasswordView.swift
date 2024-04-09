//
//  ForgotPasswordView.swift
//  Craft Alley
//
//  Created by Mariam Hussein on 7/6/23.
//

import SwiftUI

struct ForgotPasswordView: View {
    @State var email: String = ""
    @State private var showAlert = false
    
    var body: some View {
        //title vstack
        ZStack{
            VStack{
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 390, height: 352)
                    .background(Color("lilac"))
                    .cornerRadius(21)
                
                //.offset(y: -100)
            }.offset(y: -350)
            
            VStack{
                Text("reset \npassword.")
                    //.padding(.trailing, 150)
                    .frame(alignment: .leading)
                    .font(.custom("MilkAndHoney-Regular", size: 55))
                    .foregroundColor(Color("dark pink"))
            }.offset(y: -280)
            
            
            VStack{
                
                TextField("Email", text: $email)
                    .frame(width: 319, height: 50)
                    .background(Color("light pink"))
                    .cornerRadius(4)
                    .overlay(
                        RoundedRectangle(cornerRadius: 4)
                            .inset(by: -2)
                            .stroke(Color("yellow"), lineWidth: 4)
                    ).padding(50)
                
                Button {
                }
            label: {
                NavigationLink(destination: chooseDestination()) {
                    Text("Send Verfication Link").bold()
                }}
            .frame(width: 200, height: 40)
            .foregroundColor(Color("dark pink"))
            .background(Color("lilac"))
            .cornerRadius(4)
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .inset(by: -2)
                    .stroke(Color("medium pink"), lineWidth: 4)
            )
            }
            .padding(.top, 120)
            .frame(maxHeight: .infinity)
                                
        }.background(Color("dark green"))
    }
        
        
    

    
    @ViewBuilder
    func chooseDestination() -> some View {
        if !email.isEmpty {
            LoginView().navigationBarBackButtonHidden(true)
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Email has been sent"),
                        message: Text("Please check your inbox for further instructions."),
                        dismissButton: .default(Text("OK"))
                    )
                }
                .onAppear {
                    showAlert = true
                }
        } else {
            ForgotPasswordView()
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Invalid email"),
                        message: Text("Please fill in the correct email."),
                        dismissButton: .default(Text("OK"))
                    )
                }
                .onAppear {
                    showAlert = true
                }
        }
    }
}


struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
    }
}
