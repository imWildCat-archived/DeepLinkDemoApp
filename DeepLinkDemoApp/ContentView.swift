// 

import SwiftUI

struct ContentView: View {
    var body: some View {
      VStack {
        Text("Hello, world!")
          .padding()
        
        Link("Setting Safari", destination: URL(string: "App-prefs:root=SAFARI&path=WEB_EXTENSIONS")!)
       
        Link("Setting Safari", destination: URL(string: "App-prefs:root=Safari&path=Downloads")!)
        Link("iCloud Safari", destination: URL(string: "prefs:root=APPLE_ACCOUNT&path=FAMILY#ICLOUD_STORAGE")!)

        
        Button(action: {
          open(urlString: "prefs:root=SAFARI&path=WEB_EXTENSIONS")
        }) {
          Text("test")
        }
      }
      .onAppear {
        print("s:", UIApplication.openSettingsURLString)
      }
    }
    
  private func open(urlString: String) {
    let url = URL(string: urlString)!
    guard UIApplication.shared.canOpenURL(url) else {
      assertionFailure()
      return
    }
    UIApplication.shared.open(url)
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
