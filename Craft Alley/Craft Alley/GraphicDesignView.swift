//
//  GraphicDesignView.swift
//  Craft Alley
//
//  Created by Mariam Hussein on 7/6/23.
//

import SwiftUI

struct GraphicDesignView: View {
    @EnvironmentObject var appData: ApplicationData
    @State private var selectedCase: ServicesViewModel?
    @State private var searchText = ""
    
    var filteredServices: [ServicesViewModel] {
        if searchText.isEmpty {
            return appData.graphicDesignList
        } else {
            return appData.graphicDesignList.filter { service in
                service.specialty.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    var body: some View {
        ZStack {
            VStack {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 390, height: 352)
                    .background(Color("yellow"))
                    .cornerRadius(21)
            }.offset(y: -350)
            
            VStack {
                Text("graphic \ndesign.")
                    .padding(.trailing, 60)
                    .frame(alignment: .leading)
                    .font(.custom("MilkAndHoney-Regular", size: 55))
                    .foregroundColor(Color("dark green"))
            }.offset(y: -280)
            
            VStack {
                SearchBar(text: $searchText) // Add the SearchBar view
                    .padding(.horizontal, 16)
                
                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 16) {
                        ForEach(filteredServices) { services in
                            NavigationLink(
                                destination: ArtistProfileView(services: services),
                                tag: services,
                                selection: $selectedCase,
                                label: {
                                    CardView(services: services)
                                        .frame(maxWidth: .infinity)
                                        .padding(.horizontal, 16)
                                }
                            )
                        }
                    }
                    .padding(.vertical, 16)
                    .background(Color("lilac"))
                }
            }
            .frame(maxHeight: .infinity)
            .padding(.top, 220)
        }
        .background(Color("lilac"))
    }
}

struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            TextField("Search", text: $text)
                .padding(8)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
            
            Button(action: {
                text = ""
            }, label: {
                Image(systemName: "xmark.circle.fill")
                    .foregroundColor(.gray)
                    .padding(8)
            })
        }
    }
}


struct GraphicDesignView_Previews: PreviewProvider {
    static var previews: some View {
        GraphicDesignView().environmentObject(ApplicationData())
    }
}
