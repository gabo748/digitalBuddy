//
//  HomeView.swift
//  DigitalBuddy
//
//  Created by Gabriel Campos on 7/10/24.
//

import SwiftUI

struct HomeView: View {
    private var userIcon: String = "person.circle"
    private var filterIcon: String = "line.3.horizontal.decrease.circle"
    private var notificationIcon: String = "bell"

    var body: some View {
        VStack {
            navigationBar

            ScrollView {
                VStack(spacing: 30) {
                    TodoCard()

                    TodoCard()

                    TodoCard()

                    TodoCard()

                    TodoCard()

                    TodoCard()
                }
                .padding(.horizontal)
            }
        }
    }

    var navigationBar: some View {
        VStack {
            HStack {
                userInformationNavigation

                Spacer()

                userNotificationNavigation
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal)
    }

    var userInformationNavigation: some View {
        HStack(spacing: 15) {
            Image(systemName: userIcon)
                .resizable()
                .frame(width: 30, height: 30)

            VStack(alignment: .leading) {
                Text("Buen día")
                    .font(.system(size: 20))
                Text("Jhon Doe!")
                    .font(.system(size: 22))
            }
        }
    }

    var userNotificationNavigation: some View {
        HStack(spacing: 15) {
            Button(action: {

            }, label: {
                Image(systemName: filterIcon)
                    .resizable()
                    .frame(width: 25, height: 25)
                    .adaptiveForegroundStyle(lightColor: .black, darkColor: .white)
            })

            Button(action: {

            }, label: {
                Image(systemName: notificationIcon)
                    .resizable()
                    .frame(width: 25, height: 25)
                    .adaptiveForegroundStyle(lightColor: .black, darkColor: .white)
            })
        }
    }
}

#Preview {
    HomeView()
}
