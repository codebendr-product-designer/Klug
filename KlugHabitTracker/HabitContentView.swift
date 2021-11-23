//
//  ContentView.swift
//  KlugHabitTracker
//
//  Created by Evans Domina Attafuah on 05/11/2021.
//

import SwiftUI
import Klug

struct HabitContentView: View {
    var body: some View {
        NavigationView {
            
                VStack {
                    
                    VStack {
                        
                        HStack {
                            
                            Button(icon: .init(systemName: "mail.stack"), title: "All Habits") {
                                
                            }
                            
                            Button(icon: .init(systemName: "plus"), title: "New Area") {
                                
                            }
                            
                            Spacer()
                            
                        }
                        .buttonStyle(.plain)
                        
                      

                    }
                  .padding(.leading, 18)
        
                
                    VStack(spacing: 6) {
                        
                        Image(systemName: "archivebox")
                            .font(.system(size: 50))
                            .padding(20)
                        
                        Text("The start of a better You!")
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Text("Habits are like dominos. As one is formed, all other will follow!")
                            .font(.title3)
                            .fixedSize(horizontal: false, vertical: true)
                            .multilineTextAlignment(.center)
               
                        
                        HStack {
                            
                            Button(icon: .init(systemName: "leaf"), title: "Meditate") {
                                
                            }
                            
                            Button(icon: .init(systemName: "list.bullet"), title: "Set a To-do List") {
                                
                            }
                            
                            Button(icon: .init(systemName: "figure.walk"), title: "Walk") {
                                
                            }
                            
                        }
                        .buttonStyle(.plain)
                        .padding(.top, 10)
                        
                        HStack {
                            
                            Button(icon: .init(systemName: "drop.fill"), title: "Drink Water") {
                                
                            }
                            
                            Button(icon: .init(systemName: "book"), title: "Read Books") {
                                
                            }
                            
                        }
                        .buttonStyle(.plain)
                        .padding(.bottom, 10)
                        
                        Spacer().frame(height: 126)
                        
                        ZStack(alignment: .bottomTrailing) {
                            Circle()
                                .frame(width: 100, height: 100)
                                .background(.black)
                                .overlay(Image(systemName: "plus"))
                        }
                      
                        
                    }
                    .padding()
                    .background(.gray.opacity(0.4))
                    .cornerRadius(12)
                    
                    Spacer().frame(height:100)
                    
                    TabView() {
                        
                        Text("Journal")
                            .tabItem {
                                Image(systemName: "swift")
                                Text("Journal")
                            }
                        
                        Text("Progress")
                            .tabItem {
                                Image(systemName: "swift")
                                Text("Progress")
                            }
                        
                        Text("Upgrade")
                            .tabItem {
                                Image(systemName: "swift")
                                Text("Upgrade")
                            }
                        
                        Text("Settings")
                            .tabItem {
                                Image(systemName: "swift")
                                Text("Settings")
                            }
                    }
                    
                    
                }
                .navigationTitle(Text("Today").foregroundColor(.green)
                )
                .navigationBarItems(trailing: Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    
                    HStack(spacing: 16) {
                        Image(systemName: "graduationcap.circle.fill")
                            .resizable()
                            .frame(width: 30, height: 30, alignment: .leading)
                            .foregroundColor(Color(.black))
                        Image(systemName: "calendar.circle.fill")
                            .resizable()
                            .frame(width: 30, height: 30, alignment: .leading)
                            .foregroundColor(Color(.black))
                    }
            }))
            
            
        }.overlay(ZStack {
            Image("JournalEmpty")
                .resizable()
                .opacity(0.0)
        })
    }
}

struct HabitContentView_Previews: PreviewProvider {
    static var previews: some View {
        HabitContentView()
            .ignoresSafeArea()
    }
}
