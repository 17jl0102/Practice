import UIKit

//税込表示
//Intを受け取りIntを返す関数
func tax(price: Int) -> Int {
    return Int(Double(price) * 1.1)
}
tax(price: 300)

//Intを受け取りIntを返す変数
let taxFunc: (Int) -> Int = {price in
    return Int(Double(price) * 1.08)
}
taxFunc(100)

//[Int]から渡した式で抽出
//Intを受け取りBoolを返すクロージャーと[Int]を受け取り[Int]を返す関数
let nums = [3,7,11,12,36]

func customFilter(nums: [Int], handler: (Int) -> (Bool)) -> [Int] {
    var result = [Int]()
    for num in nums {
        if handler(num) {
            result.append(num)
        }
    }
    return result
}
//偶数を求める式
customFilter(nums: nums,handler: {num in
                return num % 2 == 0})
//11以下を求める式
customFilter(nums: nums, handler: {num in
                return 11 >= num})

//文字数を数える
//Stringを受け取ってIntを返す変数
var scount = { (string: String) -> Int in
    return string.count
}
scount("testArgument")

//Stringを受け取ってIntを返す変数（引数と戻り値を省略）
var scount2: (String) -> Int
scount2 = {string in
    return string.count
}
scount2("testArgument")

//Intを受け取ってIntを返す変数(簡略引数名)
let multiplication: (Int, Int) -> Int = {
    return $0 * $1
}
multiplication(8,7)

//Stringを受け取ってStringを返す変数(キャプチャ)
let Thanks: (String) -> String
    do {
        let symbol = "!"
        Thanks = { user in
        return "Thank you \(user)\(symbol)"
        }
    }
Thanks("Ringo")

//累乗
//Intを返す変数(キャプチャ)
let power: () -> Int
    do {
        var num = 2
        power = {
        num *= num
        return num
    }
    }
power()
power()
power()

//escaping属性（関数のスコープ外からキャプチャする際に使用）
var queue: [() -> Void] = []
func enqueue(operation: @escaping () -> Void) {
    queue.append(operation)
}
enqueue {print("executed")}
enqueue {print("executed2")}
queue.forEach {$0()}

//autoclosure属性（遅延評価(全ての処理を終えてから結果を出す)を書きやすくする）
func or(_ lhs: Bool, _ rhs: @autoclosure () -> Bool) -> Bool {
    if lhs {
        print("true")
        return true
    } else {
        let rhs = rhs()
        print(rhs)
        return rhs
    }
}

func lhs() -> Bool {
    print("lhs()関数が実行されました")
    return true
}

func rhs() -> Bool {
    print("rhs()関数が実行されました")
    return false
}

or(lhs(), rhs())

//トレイリングクロージャー
func execute(parameter: Int, handler: (String) -> Void) {
    handler("parameter is \(parameter)")
}

execute(parameter: 1) { String in
    print(String)
}

//変数化したクロージャー
func double(_ x: Int) -> Int {
    return x * 2
}

let primeNumber = [1,3,5]
let doubleArray = primeNumber.map(double)

var board: [[Int]] = {
    let sideLength = 3
    let row = Array(repeating: 1, count: 3)
    let board = Array(repeating: row, count: sideLength)
    return board
}()
board
