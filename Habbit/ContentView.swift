import SwiftUI

struct ContentView: View {
    var body: some View {
            Text("Hello, world!")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}


struct Home: View {
    @State private var dark = false
    @State private var show = false
    var body: some View {
         ZStack(alignment: .leading) {
            GeometryReader { geo in
                VStack {
                    ZStack {
                        HStack{
                            Button(action: {
                                withAnimation(.default) {
                                    self.show.toggle()
                                }
                            }) {
                                Image(systemName: "text.justify")
                                    .resizable()
                                    .frame(width: 25, height: 25)
                            }
                            
                            Spacer()
                        }
                        Text("Menu")
                    }
                    .padding()
                    .foregroundColor(.primary)
                    .overlay(Rectangle().stroke(Color.primary.opacity(0.1 ), lineWidth: 1).edgesIgnoringSafeArea(.top ))
                    
                    Spacer()
                    
                    Text("CONTENT WILL BE SOON")
                    
                    Spacer()
                }
            }
             HStack {
                 Menu(dark: self.$dark, show: self.$show)
                     .preferredColorScheme(self.dark ? .dark : .light)
                     .offset(x: self.show ? 0 : -UIScreen.main.bounds.width / 1.5)
                 
                 Spacer(minLength: 0)
             }
             .background(Color.primary.opacity(self.show ? (self.dark ? 0.05 : 0.2) : 0).edgesIgnoringSafeArea(.all))
        }
    }
}

struct Menu: View {
    @Binding var dark: Bool
    @Binding var show: Bool

    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    withAnimation(.default) {
                        self.show.toggle()
                    }
                }) {
                    Image(systemName: "chevron.backward")
                        .resizable()
                        .frame(width: 12, height: 20)
                }
                
                Spacer()
                
                Text("Habbit")
                    .foregroundColor(Color("logoColor"))
                    .font(.system(size: 37))
                    .bold()

                
                Spacer()

            }
            .padding(.top)
            .padding(.bottom, 25)
            
            VStack(spacing: 12) {
                Text("Some motivation text")
                    .foregroundColor(self.dark ? Color("motivationColor"): Color("motivationColorDark"))
                    .font(.title2)
                    .bold()
            }
            .padding(.top, 20)
            
            Group {
                Text("Your list of habits")
                    .padding(.top, 20)
                    .foregroundColor(self.dark ? .white: .black)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Button(action: {
                    
                }) {
                    HStack {
                        Image(systemName: "graduationcap.fill")
                            .resizable()
                            .foregroundColor(Color("logoColor"))
                            .frame(width: 25, height: 25)
                        
                        Text("Studying")
                            .foregroundColor(self.dark ? Color.white : Color.black)
                            .font(.system(size: 20))
                        
                        Spacer()
                    }
                }
                .padding(.top, 20)
                
                Button(action: {
                    
                }) {
                    HStack {
                        Image(systemName: "heart.text.square.fill")
                            .resizable()
                            .foregroundColor(Color("logoColor"))
                            .frame(width: 25, height: 25)
                        
                        Text("Sport")
                            .foregroundColor(self.dark ? Color.white : Color.black)
                            .font(.system(size: 20))
                        
                        Spacer()
                    }
                }
                .padding(.top, 20)
                
                Button(action: {
                    
                }) {
                    HStack {
                        Image(systemName: "leaf.fill")
                            .resizable()
                            .foregroundColor(Color("logoColor"))
                            .frame(width: 25, height: 25)
                        
                        Text("Diet")
                            .foregroundColor(self.dark ? Color.white : Color.black)
                            .font(.system(size: 20))
                        
                        Spacer()
                    }
                }
                .padding(.top, 20)
                
                Divider()
                    .padding(.top, 20)
                
                HStack {
                    HStack {
                        Image(systemName: "moon.fill")
                            .font(.title2)
                            .foregroundColor(Color("logoColor"))
                        
                        Text("Dark Mode")
                            .foregroundColor(self.dark ? Color.white : Color.black)
                            .font(.system(size: 20))
                        
                        Spacer()
                    }
                    
                    
                    Button(action: {
                        self.dark.toggle()
                        
                        UIApplication.shared.windows.first?.rootViewController?.view.overrideUserInterfaceStyle = self.dark ? .dark : .light
                    }) {
                        Image(self.dark ? "on" : "off")
                            .resizable()
                            .font(.title)
                            .frame(width: 40, height: 25)
                    }
                }
                .padding(.top, 20)
                
                Button(action: {
                    
                }) {
                    HStack {
                        Image(systemName: "a.square.fill")
                            .resizable()
                            .foregroundColor(Color("logoColor"))
                            .frame(width: 25, height: 25)
                        
                        Text("Language")
                            .foregroundColor(self.dark ? Color.white : Color.black)
                            .font(.system(size: 20))
                        
                        Spacer()
                    }
                }
                .padding(.top, 20)
            }
            
            Spacer()

        }
        .foregroundColor(.primary)
        .padding(.horizontal, 20)
        .frame(width: UIScreen.main.bounds.width / 1.5)
        .background((self.dark ? Color.black : Color.white).edgesIgnoringSafeArea(.all))
        .overlay(Rectangle().stroke(Color.primary.opacity(0.2), lineWidth: 2).shadow(radius: 2).edgesIgnoringSafeArea(.all))
    }
}
