//
//  AppCommands.swift
//  autoinput
//
//  Created by 张一鸣 on 2021/1/17.
//

import SwiftUI

struct AppCommands: Commands {
    
    
    @CommandsBuilder var body: some Commands {
        CommandGroup(replacing: .appInfo, addition: {
            Button(action: {
                let contentView =
                    VStack{
                        Text("autoinput delevopd by ")
                        Link("swift-zym\n",destination: URL(string: "https://github.com/swift-zym")!)
                        Text("thanks")
                        Link("luogu@AuCloud\n",destination: URL(string: "https://www.luogu.com.cn/user/75954")!)
                        Link("luogu@Return_\n",destination: URL(string: "https://www.luogu.com.cn/user/175273")!)
                        Link("luogu@chenwenda316\n",destination: URL(string: "https://www.luogu.com.cn/user/226621")!)
                    }.frame(minWidth: 200, minHeight: 200, alignment: .center)
                var window: NSWindow!
                window = NSWindow(
                        contentRect: NSRect(x: 0, y: 0, width: 480, height: 300),
                        styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
                        backing: .buffered, defer: false)
                window.isReleasedWhenClosed = false
                window.center()
                window.setFrameAutosaveName("Main Window")
                window.contentView = NSHostingView(rootView: contentView)
                window.makeKeyAndOrderFront(nil)
            }, label: {
                Text("关于...")
            })
            Button(action: {
                let contentView =
                    VStack{
                        Text("在左侧输入文本并在右侧调整好速度后，在3s点击您要输入的文本框使其获得焦点，3s过后会自动开始输入")
                    }.frame(minWidth: 200, minHeight: 200, alignment: .center)
                var window: NSWindow!
                window = NSWindow(
                        contentRect: NSRect(x: 0, y: 0, width: 480, height: 300),
                        styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
                        backing: .buffered, defer: false)
                window.isReleasedWhenClosed = false
                window.center()
                window.setFrameAutosaveName("Main Window")
                window.contentView = NSHostingView(rootView: contentView)
                window.makeKeyAndOrderFront(nil)
            }, label: {
                Text("帮助...")
            })
        })
    }
}
