//
//  ContentView.swift
//  autoinput
//
//  Created by 张一鸣 on 2021/1/17.
//

import SwiftUI
import Foundation

func paste(waitTime:useconds_t=100000){
    usleep(waitTime)
    let push = CGEvent(keyboardEventSource: nil, virtualKey: 0x09, keyDown: true)
    push?.flags = CGEventFlags.maskCommand
    if let push = push {
        push.post(tap: .cghidEventTap)
    }
}

func pasteString(str:String){
    print("pasteboard:\(str)")
    sleep(3)
    for i in 0..<str.count{
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString("\(str[str.index(str.startIndex, offsetBy: i)])", forType: .string)
        paste()
    }
}
struct ContentView: View {
    @State private var fullText: String = "请在这里输入文本..."
    @State private var speed = 500000.0
    var body: some View {
        HStack{
            VStack{
                TextEditor(text: $fullText)
                Button(action: {
                    pasteString(str: "$"+fullText)
                }, label: {
                    Text("开始输入")
                })
            }
            VStack{
                Text("输入速度")
                Slider(value: $speed,
                       in: 500000...1000000
                )
                Text("\(speed/1000000)秒/字符")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
