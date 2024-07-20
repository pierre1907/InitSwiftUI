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
    @State private var mauvaisEmail = ""
    @State private var mauvaisMotDePasse = ""
    @State private var showingLoginScreen = false
    
    var body: some View {
        NavigationView{
            ZStack{
                Color.blue
                    .ignoresSafeArea()
                
                Circle()
                    .scale(1.7)
                    .foregroundColor(.white.opacity(0.15))
                
                Circle().scale(1.35).foregroundColor(.white)
                
                VStack{
                    Text("Connexion")
                        .font(.title)
                        .bold()
                        .padding()
                    
                    VStack(alignment: .leading) {
                        TextField("Email", text: $email)
                            .padding()
                            .frame(width: 300, height: 50)
                            .background(Color.black.opacity(0.05))
                            .cornerRadius(10)
                            .border(mauvaisEmail.isEmpty ? Color.clear : Color.red, width: 1)
                        
                        if !mauvaisEmail.isEmpty {
                            Text(mauvaisEmail)
                                .foregroundColor(.red)
                                .font(.caption)
                        }
                    }
                    
                    VStack(alignment: .leading) {
                        SecureField("Mot de passe", text: $motDePasse)
                            .padding()
                            .frame(width: 300, height: 50)
                            .background(Color.black.opacity(0.05))
                            .cornerRadius(10)
                            .border(mauvaisMotDePasse.isEmpty ? Color.clear : Color.red, width: 1)
                        
                        if !mauvaisMotDePasse.isEmpty {
                            Text(mauvaisMotDePasse)
                                .foregroundColor(.red)
                                .font(.caption)
                        }
                    }
                    
                    Button("Se Connecter"){
                        authenticateUser(email: email, motDePasse: motDePasse)
                    }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(Color.blue)
                    .cornerRadius(20)
                    .padding(40)
                    
                    HStack {
                        Text("Vous n'avez pas de compte ? ")
                        
                    }
                    
                    NavigationLink(destination: SignupView()) {
                        Text("Inscrivez-vous")
                            .bold()
                            .foregroundColor(.blue)
                    }
                    
                    NavigationLink(destination: Text("\(email) vous êtes connecté"), isActive: $showingLoginScreen) {
                        EmptyView()
                    }
                    
                }
            }
            .navigationBarHidden(true)
        }
    }
    
    func authenticateUser(email: String, motDePasse: String) {
        var valide = true
        
        if email.isEmpty {
            mauvaisEmail = "L'email est requis."
            valide = false
        } else if email.lowercased() != "ksi225" {
            mauvaisEmail = "Email incorrect."
            valide = false
        } else {
            mauvaisEmail = ""
        }
        
        if motDePasse.isEmpty {
            mauvaisMotDePasse = "Le mot de passe est requis."
            valide = false
        } else if motDePasse.lowercased() != "azerty" {
            mauvaisMotDePasse = "Mot de passe incorrect."
            valide = false
        } else {
            mauvaisMotDePasse = ""
        }
        
        if valide {
            showingLoginScreen = true
        }
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
