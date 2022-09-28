//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by kekeli on 17/09/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var showingScore = false
    @State private var scoretitle  = ""
   @State private var  countries=["Estonia","Franc","Germany","Ireland","Italy","Nigeria","poland","Russia","Spain","UK","US"].shuffled()
     @State private var CorrectAnswer = Int.random(in: 0...2)
    
    var body: some View {
        ZStack{
            Color.blue
                .ignoresSafeArea()
            
            VStack(spacing: 30){
                VStack{
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                        .font(.subheadline.weight(.heavy))
                    
                    Text(countries[CorrectAnswer])
                        .foregroundColor(.white)
                        .font(.callout)
                }
                ForEach(0..<3) { number in
                    Button{
                     flagTapped(number)
                    } label: {
                        Image(countries[number])
                            .renderingMode(.original)
                            .clipShape(Capsule())
                            .shadow(radius: 5)
                    }
                }
                
                
            }
            
        }
        .alert(scoretitle, isPresented: $showingScore){Button("Continue", action: askQuestion)
        } message: {
            Text("Your is score is ???")
        }
    }
    func flagTapped(_ number: Int) {
        if number == CorrectAnswer {
            scoretitle = "correct"
        } else {
            scoretitle = "Wrong"}
        
        showingScore = true
    }
    func askQuestion(){
        countries.shuffle()
        CorrectAnswer = Int.random(in: 0...2)
    }
        }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

 
