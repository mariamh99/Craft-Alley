//
//  Data.swift
//  Craft Alley
//
//  Created by Mariam Hussein on 7/5/23.
//

import Foundation

struct User: Identifiable, Equatable {
    let id = UUID()
    var emailAddress: String = ""
    var username: String = ""
    var password: String = ""
    var category: String = ""
    var firstName: String = ""
    var lastName: String = ""
}

struct Services: Hashable {
    var image: String
    var firstName: String
    var lastName: String
    var email: String
    var profile: String
    var specialty: String
    var bio: String
    var offers: String
    var process: String
    var url: String
}

struct ServicesViewModel: Identifiable, Hashable {
    let id = UUID()
    var services: Services
    var image: String {
        return services.image
    }
    var firstName: String {
        return services.firstName
    }
    var lastName: String {
        return services.lastName
    }
    var email: String {
        return services.email
    }
    var profile: String {
        return services.profile
    }
    var specialty: String {
        return services.specialty
    }
    var bio: String {
        return services.bio
    }
    var offers: String {
        return services.offers
    }
    var process: String {
        return services.process
    }
    var url: String {
        return services.url
    }
}

class ApplicationData: ObservableObject {
    @Published var userData: [User]
    @Published var graphicDesignList: [ServicesViewModel]
    @Published var artList: [ServicesViewModel]
    @Published var vidList: [ServicesViewModel]
    @Published var othersList: [ServicesViewModel]
    @Published var loggedInUserFirstName: String = ""
    
    init() {
        userData = [
            User(emailAddress: "mariamh99@gmail.com", username: "mars", password: "12345", category: "Buyer", firstName: "Mariam", lastName: "Hussein"),
            
            User(emailAddress: "User1234@gmail.com", username: "johnny", password: "67890", category: "Buyer", firstName: "John", lastName: "Appleseed")
        ]
        
        graphicDesignList = [
            ServicesViewModel(services:Services(image: "emilyC", firstName: "Emily", lastName: "Carter", email: "user@icloud.com",profile: "Professional Branding Expert", specialty: "Designing Impactful Logos and Brand Identities", bio: "\nWelcome! I'm Emily Carter, a professional branding expert dedicated to helping businesses elevate their presence through thoughtfully designed logos and brand identities. With my expertise in visual storytelling, I've successfully assisted numerous clients in creating memorable brand experiences.", offers: "\n- Custom typography designs tailored to your project and vision. \n- Expertise in various typographic styles and techniques. \n- Attention to detail in spacing, kerning, and letterforms. \n- Collaboration and open communication throughout the design process. \n- Dedication to delivering high-quality typographic solutions.", process: "\nWe'll start by discussing your project requirements, objectives, and any specific concepts or themes you have in mind. From there, I'll explore different typographic styles, experiment with letterforms, and create initial design concepts. \nI'll keep you involved throughout the design phase, seeking your input and feedback to ensure the final product aligns perfectly with your vision. I pay close attention to detail, ensuring that every element is meticulously crafted for a harmonious and impactful typographic composition.", url: "https://www.apple.com/")),
                            
            ServicesViewModel(services:Services(image: "sarah", firstName: "Sarah", lastName: "Miller", email: "user@icloud.com", profile: "Typography Designer", specialty: "Creating Visually Creative Typography", bio: "\nHello! I'm Sarah Miller, a passionate typography designer. I believe that typography is an art form that has the power to bring words to life and evoke emotions. I specialize in creating visually stunning and expressive typography designs that captivate and engage audiences.", offers: "\n- Custom typography designs tailored to your project and vision. \n- Expertise in various typographic styles and techniques. \n- Attention to detail in spacing, kerning, and letterforms. \n- Collaboration and open communication throughout the design process. \n- Dedication to delivering high-quality typographic solutions. Preserve your precious moments with Alex's expertise.", process: "\nWe'll start by discussing your project requirements, objectives, and any specific concepts or themes you have in mind. From there, I'll explore different typographic styles, experiment with letterforms, and create initial design concepts. \nI'll keep you involved throughout the design phase, seeking your input and feedback to ensure the final product aligns perfectly with your vision. I pay close attention to detail, ensuring that every element is meticulously crafted for a harmonious and impactful typographic composition.", url: "https://www.apple.com/")),
                    
            ServicesViewModel(services:Services(image: "emilyT", firstName: "Emily", lastName: "Thompson", email: "user@icloud.com", profile: "Poster Designer", specialty: "Designing Engaging Posters", bio: "\nGreetings! I'm Emily Thompson, a dedicated poster designer with a passion for creating visually impactful designs that capture attention and convey messages effectively. With a keen eye for aesthetics and a deep understanding of design principles, I specialize in crafting posters that engage audiences and leave a lasting impression.", offers: "\n- Custom poster designs tailored to your specific needs and objectives. \n- Expertise in visual composition, typography, color theory, and imagery. \n- Attention to detail, ensuring cohesive and visually appealing designs. \n- Collaboration and open communication throughout the design process. \n- Commitment to delivering high-quality posters that exceed your expectations.", process: "\nOur collaboration begins with a discussion about your project goals, target audience, and desired message. I'll carefully consider your input and conduct research to gain a deeper understanding of your brand or event. Using this information, I'll create initial design concepts, focusing on visual composition, typography, and imagery that effectively communicate your message. \nThroughout the design process, your feedback and input are vital. We'll work together to refine the chosen concept, ensuring it aligns perfectly with your vision. I pay close attention to details, ensuring the final poster design stands out and resonates with your audience.", url: "https://www.apple.com/"))
                
            ]
             
        artList = [
            ServicesViewModel(services:Services(image: "michael", firstName: "Michael", lastName: "Davis", email: "user@icloud.com", profile: "Custom Painting Commissions", specialty: "Creating Unique & Meaningful Paintings", bio: "\nHello there! I'm Michael Davis, a passionate painter specializing in custom painting commissions. I believe that art has the power to evoke emotions, capture memories, and bring beauty into people's lives. With my expertise and artistic vision, I strive to create unique and meaningful paintings that resonate with my clients.", offers: "\n- Custom painting commissions tailored to your specific requests and preferences. \n- Expertise in various painting styles, including realism, impressionism, and abstract. \n- Attention to detail, ensuring a high level of craftsmanship and artistic quality. \n- Collaboration and open communication throughout the commission process. \n- Commitment to delivering paintings that exceed your expectations.", process: "\nOur journey begins with a conversation where we discuss your vision, inspiration, and desired outcome for the painting. Whether it's a portrait, landscape, still life, or any other subject matter, I'll carefully listen to your ideas and provide guidance if needed. Based on our discussion, I'll create initial sketches or color studies to capture the essence of the painting. \nThroughout the painting process, I'll keep you updated with progress photos and seek your input to ensure the artwork aligns with your vision. I'll dedicate time and attention to capturing the right textures, colors, and details to bring your vision to life on canvas. Rest assured, the final painting will be a unique piece of art that reflects your individuality and resonates with your emotions.", url: "https://www.apple.com/"))
            ]
        
        othersList = [
            ServicesViewModel(services:Services(image: "olivia", firstName: "Olivia", lastName: "Anderson", email: "user@icloud.com", profile: "Clothing Designer", specialty: "Designing Aesthetic & Appealing Clothes", bio: "\nWelcome! I'm Olivia Anderson, a dedicated clothing designer with a passion for creating stylish and unique garments that celebrate individuality and self-expression. With a keen eye for fashion trends and a commitment to quality craftsmanship, I specialize in designing clothing that combines aesthetic appeal with comfort and functionality.", offers: "\n- Custom clothing designs tailored to your personal style and preferences. \n- Expertise in a wide range of clothing categories, including casual wear, formal attire, and special occasion garments. \n- Attention to detail, ensuring impeccable fit, flattering silhouettes, and high-quality materials. \n- Collaboration and open communication throughout the design process. \n- Commitment to delivering garments that make you look and feel confident and fashionable.", process: "\nOur collaboration begins with an in-depth discussion to understand your style, body type, and specific clothing needs. I'll take the time to listen to your preferences, inspirations, and any specific design elements you desire. From there, I'll develop initial design concepts, incorporating the latest fashion trends and incorporating your unique personality. \nThroughout the design process, I'll keep you involved, sharing sketches, fabric samples, and fittings to ensure the perfect fit and overall satisfaction. I'm dedicated to bringing your vision to life while infusing my expertise to create garments that are both visually stunning and comfortable to wear.", url: "https://www.apple.com/"))
            ]
        
        vidList = [
            ServicesViewModel(services:Services(image: "alex", firstName: "Alex", lastName: "Johnson", email: "user@icloud.com", profile: "YouTube Video Editor", specialty: "Creating Engaging Video Content", bio: "\nHello! I'm Alex Johnson, a skilled YouTube video editor passionate about creating engaging and polished video content. With extensive experience in video editing and a deep understanding of YouTube's unique requirements, I specialize in helping content creators elevate their videos and captivate their audiences.", offers: "\n- Professional video editing services tailored to your specific YouTube channel and content style. \n- Expertise in editing software such as Adobe Premiere Pro, Final Cut Pro, and DaVinci Resolve. \n- Attention to detail, ensuring seamless transitions, engaging visuals, and compelling storytelling. \n- Collaboration and open communication throughout the editing process. \n- Commitment to delivering high-quality videos that align with your brand and vision.", process: "\nOur collaboration starts with a comprehensive discussion about your YouTube channel, content goals, and editing preferences. Whether it's vlogs, tutorials, gaming videos, or any other genre, I'll closely listen to your vision and creative input. Based on your requirements, I'll meticulously edit your raw footage, incorporating visual effects, music, sound design, and graphics to enhance the overall production value. \nThroughout the editing process, I'll keep you updated, sharing drafts and seeking your feedback to ensure the final video exceeds your expectations. I understand the importance of maintaining your unique brand identity, and I'll work closely with you to achieve the desired style and tone for your content.", url: "https://www.apple.com/")),
            
            ServicesViewModel(services:Services(image: "sophia", firstName: "Sophia", lastName: "Martinez", email: "user@icloud.com", profile: "Social Media Video Editor", specialty: "Crafting Captivating Video Content", bio: "\nHello there! I'm Sophia Martinez, a talented social media video editor with a passion for crafting captivating and shareable video content. With expertise in editing techniques optimized for various social media platforms, I specialize in helping brands and influencers make an impact and connect with their target audiences through visually compelling videos.", offers: "\n- Professional video editing services tailored specifically for social media platforms. \n- Proficiency in editing software like Adobe Premiere Pro, Final Cut Pro, and iMovie. \n- Attention to detail, ensuring seamless transitions, eye-catching visuals, and engaging storytelling. \n- Collaboration and open communication throughout the editing process. \n- Dedication to delivering high-quality videos that align with your brand's identity and social media objectives.", process: "\nOur collaboration begins with a detailed discussion about your social media goals, target audience, and content preferences. Whether it's Instagram, TikTok, Facebook, or any other platform, I'll closely listen to your vision and creative input. Based on your requirements, I'll meticulously edit your footage, optimizing it for the specific platform's format and duration, and incorporating relevant captions, graphics, and music to enhance engagement. \nThroughout the editing process, I'll provide regular updates and seek your feedback to ensure the final video aligns perfectly with your brand's style and resonates with your audience. I understand the importance of delivering content that stands out in the fast-paced social media landscape.", url: "https://www.apple.com/"))
        ]
        
    }
}
