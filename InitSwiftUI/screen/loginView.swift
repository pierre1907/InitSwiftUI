//
//  loginView.swift
//  InitSwiftUI
//
//  Created by Saint-Pierre KASSI on 20/07/2024.
//

import Foundation
import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var motDePasse = ""
    @State private var mauvaisEmail = 0
    @State private var mauvaisMotDePasse = 0
    @State private var showingLoginScreen = false
    
    var body: some View {
        NavigationView{
            ZStack{
                Color.blue
                    .ignoresSafeArea()
                
                Circle()
                    .scale(1.7)
                    .foregroundColor(.white.opacity(0.15)
                    )
                
                Circle().scale(1.35).foregroundColor(.white)
                
                VStack{
                    Text("Connexion")
                        .font(.title)
                        .bold()
                        .padding()
                    
                    TextField("Email", text: $email)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(mauvaisEmail))
                    
                    
                    SecureField("Mot de passe", text: $motDePasse)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(mauvaisMotDePasse))

                    
                    
                    Button("Se Connecter"){
                        authencticateUser(email: email, motDePasse: motDePasse)
                    }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(Color.blue)
                    .cornerRadius(20)
                    
                    
                    NavigationLink(destination: Text("\(email) vous êtes conncté"), isActive: $showingLoginScreen){
                        EmptyView()
                        
                    }
                    
                }
            }
            .navigationBarHidden(true)
        }
        
        
    }
    func authencticateUser(email: String, motDePasse: String){
        if email.lowercased() == "ksi225" {
            mauvaisEmail = 0
            if motDePasse.lowercased() == "azerty" {
                mauvaisMotDePasse = 0
                showingLoginScreen = true
            } else {
                mauvaisMotDePasse = 2
            }
        } else {
            mauvaisEmail = 2
        }
    }
}

    

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
