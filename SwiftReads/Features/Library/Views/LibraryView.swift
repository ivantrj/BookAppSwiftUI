//
//  LibraryView.swift
//  SwiftReads
//
//  Created by Ivan Trajanovski  on 07.05.24.
//

import SwiftUI

struct LibraryView: View {
    @State private var selectedOption = 0
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Picker(selection: $selectedOption, label: Text("Select Option")) {
                        Text("Reading").tag(0)
                        Text("Read").tag(1)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    Text("Selected Option: \(selectedOption == 0 ? "Reading" : "Read")")
                        .padding()
                }
                .padding()
            }
            .navigationTitle("Library")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    LibraryView()
}
