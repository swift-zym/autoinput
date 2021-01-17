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

struct ContentView: View {
    var body: some View {
        Button(action: {
            let str=NSPasteboard.general.string(forType: .string)
            print("pasteboard:\(str ?? "null")")
            sleep(3)
            if str != nil{
                for i in str!.indices{
                    NSPasteboard.general.clearContents()
                    NSPasteboard.general.setString("\(str![i])", forType: .string)
                    paste()
                }
            }
        }, label: {
            Text("paste")
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
