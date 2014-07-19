// Playground - noun: a place where people can play

import Cocoa
import XCPlayground
import Dispatch
import ObjectiveC


class Fetch {
    init() {
        
    }
    class func fetch(#url: NSURL,block: (data:String, error:NSError?) -> Void) -> Void {

    var request = NSURLRequest(URL: url)
    NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler: {
        resp, data, err in
            let body = NSString(data: data, encoding:NSUTF8StringEncoding)
            block(data: body, error: nil)
        })
        
    }
}

reflect(Fetch()).summary
reflect(Fetch()).disposition
reflect(Fetch()).valueType


objc_getClass("NSURL").classDescription

// optionals
var i:Int? // initial value is nil
i //
i = "123".toInt()
var j:Int = i! // unwrap the optional


var d = Dictionary<String,AnyObject?>()
d["data"] = NSData()
d["name"] = "hello"

func sayHello(name personName: String, last lastName:String) -> String {
    let greeting = "Hello, " + personName + "!"
    return greeting
}

sayHello(name: "Brian", last: "Pfeil")

func someFunctionThatTakesAClosure(closure: () -> ()) {
    closure()
}

someFunctionThatTakesAClosure(){
    var s1 = "abc"
}


/*
class Person{}; Person.class

var cls : (AnyClass!) = class_getSuperclass(Fetch)
*/

Fetch.fetch(url: NSURL(string: "http://www.google.com"), block: {
    data, error in
    XCPCaptureValue("Fetch.fetch", data)
})



["one", "two", "three"].map({s in s + "!"})

// ---
// closure / a function that creates a function
func makeAddNFn(n:Int) -> ((x:Int) -> Int) {
    return {x in return n + x}
}

var add2Fn = makeAddNFn(2)
add2Fn(x: 5)

// ---


// for async calls to run
XCPSetExecutionShouldContinueIndefinitely(continueIndefinitely: true)



var str = "Hello, playground"

var s:String = ""
s.isEmpty
s = "Hello World"

NSProcessInfo.processInfo().arguments


var names = ["Brian", "Tricia", "Wyatt", "Max"]


for name in names {
    println(name)
}

join("|", names)

var plurals = names.map({
    (s:String) -> String in
    return s + "s"
})

plurals

var ss = names.map({name in name + "z"})
ss

names
names[0]

var person = ["name": "brian", "age": "36"]
join(",", person.keys)

func writeToFile(#contents: String, #path:String) -> Void {
    contents.writeToFile(path, atomically: true, encoding: NSUTF8StringEncoding, error: nil)
}

var tmpDirPath = "/Users/pfeilbr/tmp"
var url = NSURL(string: "http://www.google.com")
var request = NSURLRequest(URL: url)
NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler: {
    resp, data, err in
        let body = NSString(data: data, encoding:NSUTF8StringEncoding)
        //XCPCaptureValue("body", body)

    writeToFile(contents: body, path: tmpDirPath + "/z.txt")
    
    })

class MyView : NSView {

    override func drawRect(dirtyRect: NSRect) {
        NSColor.greenColor().setFill()
        NSRectFill(dirtyRect)
    }
}

var v1 = MyView(frame: NSRect(x: 0, y: 0, width: 200, height: 200))

XCPShowView("MyView", v1)

extension String {
    var foo:String {
        return self + "foo"
    }
    
    static func echo(s:String) -> String {
        return s;
    }
}


var extStr = "hello "
extStr.foo
String.echo("chamber")

var fns = [
    {
        (s:String)->String in
        return s + "fooy"
    },
    {
        (s:String)->String in
        return s + "hooy"
    }
]

var results = String[]()

for fn in fns {
    results += fn("baba")
}

join(",", results)


//dispatch_async(dispatch_get_current_queue(), {
//    XCPCaptureValue("dispatch val", "async here")
//})



