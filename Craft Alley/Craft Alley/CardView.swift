//
//  CardView.swift
//  Craft Alley
//
//  Created by Mariam Hussein on 7/6/23.
//

import SwiftUI

struct CardView: View {
    let services: ServicesViewModel
    
    var body: some View {
        ZStack{
            VStack{
                Image(services.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200)
                    .background(Color("medium pink"))
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color("dark green"), lineWidth: 4))
                
                Text("\(Text("Specialty: ").bold())\(services.specialty)")
                    .font(.system(size: 16))
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.black)
                    .padding()
            }
        }     .frame(maxWidth: .infinity, alignment: .center)
            .background(Color("medium pink"))
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color("light pink"), lineWidth: 4)
            )
        
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(services: ServicesViewModel(services:Services(image: "emilyC", firstName: "Emily", lastName: "Carter", email: "user@icloud.com", profile: "Professional Branding Expert", specialty: "Designing Impactful Logos and Brand Identities", bio: "\nWelcome! I'm Emily Carter, a professional branding expert dedicated to helping businesses elevate their presence through thoughtfully designed logos and brand identities. With my expertise in visual storytelling, I've successfully assisted numerous clients in creating memorable brand experiences.", offers: "\n- Custom typography designs tailored to your project and vision. \n- Expertise in various typographic styles and techniques. \n- Attention to detail in spacing, kerning, and letterforms. \n- Collaboration and open communication throughout the design process. \n- Dedication to delivering high-quality typographic solutions.", process: "\nWe'll start by discussing your project requirements, objectives, and any specific concepts or themes you have in mind. From there, I'll explore different typographic styles, experiment with letterforms, and create initial design concepts. \nI'll keep you involved throughout the design phase, seeking your input and feedback to ensure the final product aligns perfectly with your vision. I pay close attention to detail, ensuring that every element is meticulously crafted for a harmonious and impactful typographic composition.", url: "https://www.apple.com/")))
    }
}

