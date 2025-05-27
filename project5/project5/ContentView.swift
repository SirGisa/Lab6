//
//  ContentView.swift
//  project5
//
//  Created by Shvarsman on 1.05.25.
//

import SwiftUI

struct ContentView: View {
    @State private var aText = ""
    @State private var cText = ""
    @State private var isIntegerMode = true
    @State private var showingResult = false
    @State private var resultValue: Double = 0.0

    let x: Double = 1.5

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text(NSLocalizedString("app.title", comment: ""))
                    .font(.largeTitle)
                    .padding()

                TextField("0", text: $aText)
                    .keyboardType(isIntegerMode ? .numberPad : .decimalPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .accessibilityLabel(Text(NSLocalizedString("field.a", comment: "")))
                    .padding(.horizontal)

                TextField("0", text: $cText)
                    .keyboardType(isIntegerMode ? .numberPad : .decimalPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .accessibilityLabel(Text(NSLocalizedString("field.c", comment: "")))
                    .padding(.horizontal)

                Picker(selection: $isIntegerMode, label: Text("")) {
                    Text(NSLocalizedString("segment.integer", comment: "")).tag(true)
                    Text(NSLocalizedString("segment.float", comment: "")).tag(false)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal)

                Button(action: calculateResult) {
                    Text(NSLocalizedString("button.calculate", comment: ""))
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                .navigationDestination(isPresented: $showingResult) {
                    ResultView(result: resultValue)
                }

                Spacer()
            }
            .padding()
        }
    }

    func calculateResult() {
        let a = Double(aText) ?? 0.0
        let c = Double(cText) ?? 0.0

        let result = a * pow(x, 2) + c
        resultValue = result
        showingResult = true
    }
}
