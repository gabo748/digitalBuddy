//
//  TodoCard.swift
//  DigitalBuddy
//
//  Created by Gabriel Campos on 7/10/24.
//

import SwiftUI

struct TodoCard: View {
    @Environment(\.colorScheme) private var colorScheme

    private var closeIcon: String = "xmark"
    private var timerIcon: String = "timer.circle"

    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 8)
                .stroke(colorScheme == .dark ? .white : .black, lineWidth: 2)
                .frame(height: 150)
                .overlay(alignment: .topTrailing) {
                    removeCardButton
                }
                .background {
                    VStack(alignment: .leading) {
                        content

                        Spacer()

                        footer

                    }
                    .frame(height: 150)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                    .padding(.top)
                }
        }
    }

    var content: some View {
        HStack {
            Image(systemName: timerIcon)
                .resizable()
                .frame(width: 25, height: 25)

            VStack(alignment: .leading) {
                Text("Tarea de computación")
                    .font(.system(size: 20))

                Text("Creado por: Jhon Doe")

                ProgressView(value: 50, total: 100)
                    .frame(width: 100)

            }
        }

    }

    var footer: some View {
        VStack(alignment: .leading) {
            Text("Entrega")
            Text("Martes 23, Septiembre 2024")
        }
        .padding(.bottom)
        .font(.system(size: 12))
    }

    var removeCardButton: some View {
        Button {

        } label: {
            Image(systemName: closeIcon)
                .resizable()
                .frame(width: 15, height: 15)
                .adaptiveForegroundStyle(lightColor: .black, darkColor: .white)
        }
        .padding(.trailing, 7)
        .padding(.top)
    }

}

#Preview {
    TodoCard()
}
