//
//  ArtistProfileView.swift
//  Craft Alley
//
//  Created by Mariam Hussein on 7/7/23.
//

import SwiftUI
import MessageUI

struct ArtistProfileView: View {
    let services: ServicesViewModel
    @State private var isShowingMailView = false
    let emailRecipient: String

    init(services: ServicesViewModel) {
        self.services = services
        emailRecipient = services.email // Replace 'services.email' with the actual variable holding the email address
    }

    var body: some View {
        ZStack {
            VStack{
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 390, height: 352)
                    .background(Color("lilac"))
                    .cornerRadius(21)
                
                //.offset(y: -100)
            }.offset(y: -350)
            
            VStack{
                Text("\(services.firstName)\n\(services.lastName).")
                    .padding(.trailing, 60)
                    .frame(alignment: .leading)
                    .font(.custom("MilkAndHoney-Regular", size: 55))
                    .foregroundColor(Color("dark pink"))
            }.offset(y: -280)
            
   
                VStack {
                    ZStack {
                        ScrollView {
                            VStack{
                                Image(services.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 200)
                                    .background(Color("medium pink"))
                                    .clipShape(Circle())
                                    .overlay(Circle().stroke(Color("dark green"), lineWidth: 4))
                                    //.offset(y: -140)
                            }.zIndex(1)
                            
                            // Content inside the ScrollView
                            LazyVStack(alignment: .leading) {
                                
                                Spacer(minLength: 110)
                                Text("\(Text("Artist Profile: ").bold())\(services.profile)")
                                    .multilineTextAlignment(.leading)
                                    .font(.system(size: 20))
                                    .padding()
                                
                                Button(action: {
                                    isShowingMailView = true
                                }) {
                                    Text("\(Text("Email Address: ").bold())\(emailRecipient)")
                                        .multilineTextAlignment(.leading)
                                        .font(.system(size: 20))
                                        .foregroundColor(Color.black)
                                        .padding()
                                }
                                .sheet(isPresented: $isShowingMailView) {
                                    MailView(recipient: emailRecipient)
                                }
                                
                                Text("\(Text("About Me: ").bold())\(services.bio)")
                                    .multilineTextAlignment(.leading)
                                    .font(.system(size: 20))
                                    .padding()
                                Text("\(Text("What I Offer: ").bold())\(services.offers)")
                                    .multilineTextAlignment(.leading)
                                    .font(.system(size: 20))
                                    .padding()
                                Text("\(Text("Work Process: ").bold())\(services.process)")
                                    .multilineTextAlignment(.leading)
                                    .font(.system(size: 20))
                                    .padding()
                                
                                Text("Click here to access my Behance website")
                                    .underline()
                                    .multilineTextAlignment(.leading)
                                    .font(.custom("IowanOldStyle-Roman", size: 20))
                                    .padding()
                                    .onTapGesture {
                                        if let url = URL(string: services.url) {
                                            UIApplication.shared.open(url)
                                        }
                                    }
                            }
                        }
                        .background(Color("light pink"))
                        .padding()


                      
                    }
                }.frame(maxHeight: .infinity)
                .padding(.top, 220)
            }.background(Color("dark green"))
            
        }
    
}

struct MailView: UIViewControllerRepresentable {
    typealias UIViewControllerType = MFMailComposeViewController

    let recipient: String

    func makeUIViewController(context: Context) -> MFMailComposeViewController {
        let viewController = MFMailComposeViewController()
        viewController.setToRecipients([recipient])
        viewController.setSubject("")
        viewController.setMessageBody("", isHTML: false)
        return viewController
    }

    func updateUIViewController(_ uiViewController: MFMailComposeViewController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    class Coordinator: NSObject, MFMailComposeViewControllerDelegate {
        func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
            controller.dismiss(animated: true)
        }
    }
}

struct ArtistProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ArtistProfileView(services: ServicesViewModel(services: Services(image: "emilyC", firstName: "Emily", lastName: "Carter", email: "user@icloud.com", profile: "Professional Branding Expert", specialty: "Designing Impactful Logos and Brand Identities", bio: "\nWelcome! I'm Emily Carter, a professional branding expert dedicated to helping businesses elevate their presence through thoughtfully designed logos and brand identities. With my expertise in visual storytelling, I've successfully assisted numerous clients in creating memorable brand experiences.", offers: "\n- Custom typography designs tailored to your project and vision. \n- Expertise in various typographic styles and techniques. \n- Attention to detail in spacing, kerning, and letterforms. \n- Collaboration and open communication throughout the design process. \n- Dedication to delivering high-quality typographic solutions.", process: "\nWe'll start by discussing your project requirements, objectives, and any specific concepts or themes you have in mind. From there, I'll explore different typographic styles, experiment with letterforms, and create initial design concepts. \nI'll keep you involved throughout the design phase, seeking your input and feedback to ensure the final product aligns perfectly with your vision. I pay close attention to detail, ensuring that every element is meticulously crafted for a harmonious and impactful typographic composition.", url: "https://www.apple.com/")))
    }
}
