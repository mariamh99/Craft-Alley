//
//  OtherServicesView.swift
//  Craft Alley
//
//  Created by Mariam Hussein on 7/6/23.
//

import SwiftUI

struct OtherServicesView: View {
    @EnvironmentObject var appData: ApplicationData
    @State private var selectedCase: ServicesViewModel?
    @State private var searchText = ""

    var filteredServices: [ServicesViewModel] {
        if searchText.isEmpty {
            return appData.othersList
        } else {
            return appData.othersList.filter { service in
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
                Text("other \nservices.")
                    .padding(.trailing, 60)
                    .frame(alignment: .leading)
                    .font(.custom("MilkAndHoney-Regular", size: 55))
                    .foregroundColor(Color("dark green"))
            }.offset(y: -280)

            VStack {
                SearchBar(text: $searchText)
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


struct OtherServicesView_Previews: PreviewProvider {
    static var previews: some View {
        OtherServicesView().environmentObject(ApplicationData())
    }
}
