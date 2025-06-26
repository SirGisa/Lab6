//
//  ResultView.swift
//  project5
//
//  Created by georg on 1.05.25.
//

import SwiftUI

struct ResultView: View {
    let result: Double
    
    var body: some View {
        ZStack {
            backgroundColor
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("\(NSLocalizedString("label.result", comment: "")) \(result, specifier: "%.2f")")
                    .font(.title)
                    .foregroundColor(textColor)
            }
        }
    }
    
    var backgroundColor: Color {
        if result < 0 {
            return Color.red.opacity(0.3)
        } else if result > 100 {
            return Color.green.opacity(0.3)
        } else {
            return Color.blue.opacity(0.3)
        }
    }
    
    var textColor: Color {
        return result < -50 || result > 50 ? .white : .black
    }
}
