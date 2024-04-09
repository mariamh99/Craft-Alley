//
//  LandingView.swift
//  Craft Alley
//
//  Created by Mariam Hussein on 7/6/23.
//

import SwiftUI

struct LandingView: View {
    var body: some View {
        ZStack{
            VStack{
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 390, height: 352)
                    .background(Color("dark green"))
                    .cornerRadius(21)
            }.offset(y: -290)
            
            VStack{
                HStack {
                    Image(systemName: "chevron.right.2")
                        .bold()
                        .foregroundColor(Color("dark pink"))
                        .font(.system(size: 30))
                        .padding(.leading)
                    Spacer()
                }
                Text("choose the \nservice you \nrequire.")
                
                    .font(.custom("MilkAndHoney-Regular", size: 50))
                    .foregroundColor(Color("cream"))
                    .multilineTextAlignment(.trailing)
            }.offset(y: -255)
            
            
            VStack {
                Button {
                }
            label: {
                NavigationLink(destination: GraphicDesignView()) {
                    Image("graphic design").offset(y: 5)
                }}
            .frame(width: 320, height: 80)
            .background(Color(red: 0.71, green: 0.74, blue: 0.94))
            .cornerRadius(4)
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .inset(by: -2)
                    .stroke(Color(red: 0.27, green: 0.53, blue: 0.36), lineWidth: 4)
            )
            .padding()
                Button {
                }
            label: {
                NavigationLink(destination: VideoEditingView()) {
                    Image("video editing").offset(y: -10)
                }}
            .frame(width: 320, height: 80)
            .background(Color(red: 0.71, green: 0.74, blue: 0.94))
            .cornerRadius(4)
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .inset(by: -2)
                    .stroke(Color(red: 0.27, green: 0.53, blue: 0.36), lineWidth: 4)
            )
            .padding()
                Button {
                }
            label: {
                NavigationLink(destination: ArtCommissionView()) {
                    Image("art commission")
                }}
            .frame(width: 320, height: 80)
            .background(Color(red: 0.71, green: 0.74, blue: 0.94))
            .cornerRadius(4)
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .inset(by: -2)
                    .stroke(Color(red: 0.27, green: 0.53, blue: 0.36), lineWidth: 4)
            )
            .padding()
                Button {
                }
            label: {
                NavigationLink(destination: OtherServicesView()) {
                    Image("other").offset(y: -20)
                }}
            .frame(width: 320, height: 80)
            .background(Color(red: 0.71, green: 0.74, blue: 0.94))
            .cornerRadius(4)
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .inset(by: -2)
                    .stroke(Color(red: 0.27, green: 0.53, blue: 0.36), lineWidth: 4)
            )
            .padding()
            }.frame(maxHeight: .infinity)
                .padding(.top, 260)
            
            
        }.background(Color("light pink"))
    }
    
}


struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        LandingView()
    }
}
