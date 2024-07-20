//
//  SignupView.swift
//  InitSwiftUI
//
//  Created by Saint-Pierre KASSI on 20/07/2024.
//

import SwiftUI

struct SignupView: View {
    @State private var nom = ""
    @State private var email = ""
    @State private var motDePasse = ""
    @State private var confirmationMotDePasse = ""
    @State private var mauvaisNom = ""
    @State private var mauvaisEmail = ""
    @State private var mauvaisMotDePasse = ""
    @State private var mauvaisConfirmationMotDePasse = ""
    @State private var showingSignupScreen = false
    
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
                    Text("Inscription")
                        .font(.title)
                        .bold()
                        .padding()
                    
                    VStack(alignment: .leading) {
                        TextField("Nom", text: $nom)
                            .padding()
                            .frame(width: 300, height: 50)
                            .background(Color.black.opacity(0.05))
                            .cornerRadius(10)
                            .border(mauvaisNom.isEmpty ? Color.clear : Color.red, width: 1)
                        
                        if !mauvaisNom.isEmpty {
                            Text(mauvaisNom)
                                .foregroundColor(.red)
                                .font(.caption)
                        }
                    }
                    
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
                    
                    VStack(alignment: .leading) {
                        SecureField("Confirmer mot de passe", text: $confirmationMotDePasse)
                            .padding()
                            .frame(width: 300, height: 50)
                            .background(Color.black.opacity(0.05))
                            .cornerRadius(10)
                            .border(mauvaisConfirmationMotDePasse.isEmpty ? Color.clear : Color.red, width: 1)
                        
                        if !mauvaisConfirmationMotDePasse.isEmpty {
                            Text(mauvaisConfirmationMotDePasse)
                                .foregroundColor(.red)
                                .font(.caption)
                        }
                    }
                    
                    Button("S'inscrire"){
                        inscrireUtilisateur(nom: nom, email: email, motDePasse: motDePasse, confirmationMotDePasse: confirmationMotDePasse)
                    }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(Color.blue)
                    .cornerRadius(20)
                    .padding(40)
                    
                    HStack {
                        Text("Vous avez déjà un compte ? ")
                    }
                    
                    NavigationLink(destination: LoginView()) {
                        Text("Connectez-vous")
                            .bold()
                            .foregroundColor(.blue)
                    }
                    
                    NavigationLink(destination: Text("\(nom) vous êtes inscrit avec l'email \(email)"), isActive: $showingSignupScreen){
                        EmptyView()
                    }
                    
                }
            }
            .navigationBarHidden(true)
        }
    }
    
    func inscrireUtilisateur(nom: String, email: String, motDePasse: String, confirmationMotDePasse: String) {
        var valide = true
        
        if nom.isEmpty {
            mauvaisNom = "Le nom est requis."
            valide = false
        } else {
            mauvaisNom = ""
        }
        
        if email.isEmpty {
            mauvaisEmail = "L'email est requis."
            valide = false
        } else {
            mauvaisEmail = ""
        }
        
        if motDePasse.isEmpty {
            mauvaisMotDePasse = "Le mot de passe est requis."
            valide = false
        } else {
            mauvaisMotDePasse = ""
        }
        
        if confirmationMotDePasse != motDePasse {
            mauvaisConfirmationMotDePasse = "Les mots de passe ne correspondent pas."
            valide = false
        } else {
            mauvaisConfirmationMotDePasse = ""
        }
        
        if valide {
            showingSignupScreen = true
        }
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
