//
//  LoginView.swift
//  Craft Alley
//
//  Created by Mariam Hussein on 7/5/23.
//

import SwiftUI

struct LoginView: View {
    @State var email: String = ""
    @State var password: String = ""
    @State private var loggedInUserFirstName: String = ""
    @State private var showAlert = false
    @EnvironmentObject var appData: ApplicationData
    
    var body: some View {
        NavigationView {
            //title vstack
            ZStack{
                VStack{
                    VStack{
                        Image("CraftAlleyTitleStars")
                            .padding(.top, 365)
                            .frame(height: 490.0)
                            .imageScale(.large)
                    }
                    
                    VStack{
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: .infinity, height: 400)
                            .background(Color(red: 0.27, green: 0.53, blue: 0.36))
                            .cornerRadius(21)
                        
                        VStack{
                            TextField("Email", text: $email)
                                .frame(width: 319, height: 50)
                                .background(Color("light pink"))
                                .cornerRadius(4)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 4)
                                        .inset(by: -2)
                                        .stroke(Color("yellow"), lineWidth: 4)
                                )
                            
                            SecureField("Password", text: $password)
                                .frame(width: 319, height: 50)
                                .background(Color("light pink"))
                                .cornerRadius(4)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 4)
                                        .inset(by: -2)
                                        .stroke(Color("yellow"), lineWidth: 4)
                                )
                                .padding(15)
                            
                            Button {
                            }
                        label: {
                            NavigationLink(destination: ForgotPasswordView()) {
                                Text("Forgot your password?").bold()
                            }}
                        .frame(maxWidth: 320, alignment: .leading)
                        .foregroundColor(Color("yellow"))
                            
                            Button {
                            }
                        label: {
                            NavigationLink(destination: chooseDestination().navigationBarBackButtonHidden(true)) {
                                Text("Sign In").bold()
                            }}
                        .frame(width: 200, height: 50)
                        .foregroundColor(Color("dark pink"))
                        .background(Color("lilac"))
                        .cornerRadius(4)
                        .overlay(
                            RoundedRectangle(cornerRadius: 4)
                                .inset(by: -2)
                                .stroke(Color("medium pink"), lineWidth: 4)
                        )
                        .padding(.top, 15)
                        .padding(.bottom, 15)
                            
                             Button {
                             }
                             label: {
                             NavigationLink(destination: SignUpView()) {
                             Text("Don't have an account? Sign Up").bold()
                             }}
                             .frame(maxWidth: 320, alignment: .trailing)
                             .foregroundColor(Color("yellow"))
                            
                            
                        }.offset(y: -370)
                    }
                    .offset(y: 130)
                    
                    
                }.background(Color("lilac"))
                
                
            }
            
        }
    }
        
        @ViewBuilder
        func chooseDestination() -> some View {
            if let user = appData.userData.first(where: { user in
                user.emailAddress == email && user.password == password
            }) {
                SlideView(loggedInUserFirstName: loggedInUserFirstName)
                    .environmentObject(appData)
                    .navigationBarBackButtonHidden(true)
                    .onAppear {
                        loggedInUserFirstName = user.username
                    }
            } else {
                LoginView()
                    .navigationBarBackButtonHidden(true)
                    .alert(isPresented: $showAlert) {
                        Alert(
                            title: Text("Invalid credentials"),
                            message: Text("The email address or password is incorrect. Please try again."),
                            dismissButton: .default(Text("OK"))
                        )
                    }
                    .onAppear {
                        showAlert = true
                    }
            }
        }
    }
    
    struct LoginView_Previews: PreviewProvider {
        static var previews: some View {
            LoginView().environmentObject(ApplicationData())
        }
    }

