//
//  EditAccountView.swift
//  Craft Alley
//
//  Created by Mariam Hussein on 7/6/23.
//

import SwiftUI

struct EditAccountView: View {
    @State var username: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State var confirmPassword: String = ""
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var selection: String = "Select your account category"
    let options = ["Select your account category", "Seller", "Buyer"]
    @State private var showAlert = false
    @EnvironmentObject var appData: ApplicationData
    
    var body: some View {
        //title vstack
        ZStack{
            
            VStack{
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 390, height: 300)
                    .background(Color("lilac"))
                    .cornerRadius(21)
                
                //.offset(y: -100)
            }.offset(y: -350)
            
            VStack{
                Text("edit \naccount.")
                    .padding(.trailing, 60)
                    .frame(alignment: .leading)
                    .font(.custom("MilkAndHoney-Regular", size: 55))
                    .foregroundColor(Color("dark pink"))
            }.offset(y: -280)
            
            
            VStack {
                TextField("Username", text: $username)
                    .frame(width: 319, height: 40)
                    .background(Color("light pink"))
                    .cornerRadius(4)
                    .overlay(
                        RoundedRectangle(cornerRadius: 4)
                            .inset(by: -2)
                            .stroke(Color("yellow"), lineWidth: 4)
                    )
                    .padding(10)
                TextField("Email", text: $email)
                    .frame(width: 319, height: 40)
                    .background(Color("light pink"))
                    .cornerRadius(4)
                    .overlay(
                        RoundedRectangle(cornerRadius: 4)
                            .inset(by: -2)
                            .stroke(Color("yellow"), lineWidth: 4)
                    )
                    .padding(10)
                SecureField("Password", text: $password)
                    .frame(width: 319, height: 40)
                    .background(Color("light pink"))
                    .cornerRadius(4)
                    .overlay(
                        RoundedRectangle(cornerRadius: 4)
                            .inset(by: -2)
                            .stroke(Color("yellow"), lineWidth: 4)
                    )
                    .padding(10)
                SecureField("Confirm", text: $confirmPassword)
                    .frame(width: 319, height: 40)
                    .background(Color("light pink"))
                    .cornerRadius(4)
                    .overlay(
                        RoundedRectangle(cornerRadius: 4)
                            .inset(by: -2)
                            .stroke(Color("yellow"), lineWidth: 4)
                    )
                    .padding(10)
                TextField("First Name", text: $firstName)
                    .frame(width: 319, height: 40)
                    .background(Color("light pink"))
                    .cornerRadius(4)
                    .overlay(
                        RoundedRectangle(cornerRadius: 4)
                            .inset(by: -2)
                            .stroke(Color("yellow"), lineWidth: 4)
                    )
                    .padding(10)
                TextField("Last Name", text: $lastName)
                    .frame(width: 319, height: 40)
                    .background(Color("light pink"))
                    .cornerRadius(4)
                    .overlay(
                        RoundedRectangle(cornerRadius: 4)
                            .inset(by: -2)
                            .stroke(Color("yellow"), lineWidth: 4)
                    )
                    .padding(10)
                
                Picker("Account Category", selection: self.$selection) {
                    ForEach(options, id: \.self) {
                        Text($0)
                            .font(.system(size: 30)) // Adjust the font size as desired
                    }
                }
                .pickerStyle(.menu)
                .tint(Color("light pink"))
                .padding()
                
                Button {
                }
            label: {
                NavigationLink(destination: chooseDestination()) {
                    Text("Save").bold()
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
                Button {
                }
            label: {
                NavigationLink(destination: LoginView().navigationBarBackButtonHidden(true)) {
                    Text("Delete Account").bold().foregroundColor(Color("yellow"))
                    }
                }.padding()
            }.frame(maxHeight: .infinity)
            .padding(.top, 200)
            
        }.background(Color("dark green"))
        
    }

    @ViewBuilder
    func chooseDestination() -> some View {
        if !email.isEmpty && !username.isEmpty && password == confirmPassword && !firstName.isEmpty &&  !lastName.isEmpty {
            SlideView(loggedInUserFirstName: username)
                .environmentObject(appData)
                .navigationBarBackButtonHidden(true)
        } else {
            EditAccountView()
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Invalid inputs"),
                        message: Text("Please fill in all the fields."),
                        dismissButton: .default(Text("OK"))
                    )
                }
                .onAppear {
                    showAlert = true
                }
        }
    }
}

struct EditAccountView_Previews: PreviewProvider {
    static var previews: some View {
        EditAccountView().environmentObject(ApplicationData())
    }
}
