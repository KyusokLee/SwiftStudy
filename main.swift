//
//  main.swift
//  SwiftStudy1
//
//  Created by Lee's Pc on 2021/09/04.
//


//Day 1
import Foundation

print("Hello, World!")
var someAny : Any = 100
someAny = "아무거나 넣을 수 있다"
someAny = 123.12
print(someAny)

var some : Any?
var someAnyObject : AnyObject?

some = nil
someAnyObject = nil
print(some as Any) //as Any 를 하는 이유???
print(someAnyObject) // 이렇게 하면 Expression implicitly coerced from 'AnyObject?' to 'Any'의 경고 메세지가 나옴.                        이유는?

var numbers : [Int] = [1, 2, 3, 4]
numbers.append(5)
numbers.append(contentsOf: [8, 7])
numbers += [6, 7]
print(numbers)
print(numbers.contains(9))
print(numbers.contains(6))
numbers.removeLast()
print(numbers)
print(numbers.count)
print(numbers.first)
print(numbers.last)
numbers.removeAll()
print(numbers)

let nums = Array(1...3) //시퀀스 대입 >>> nums라는 이름의 배열에 1부터 3까지 연속적인 값을 대입한다.
print(nums)
let nums2 = Array(3...11)
print(nums2)
var nums3 = Array(4...9)
print(nums3)
// nums2[2] = 7 // 컴파일 오류 발생 >> 이유? nums2 는 변동의 가능성여부가 없는 상수타입으로 설정되었기에 요소의 변경이 불가능하다
nums3[2] = 7
print(nums3[2]) // 반면에 이번엔 컴파일 오류가 발생하지 않는다. >> 이유? nums3는 변동의 가능성이 있는 변수 선언 즉, var로 선언 되었기 떄문에 변경이 가능하다.
let anyArr: [Any] = [1, 2, "three", "four"] //한 배열 안에 여러 타입의 값을 넣고 싶다면 'Any'를 사용하면 된다.
print(anyArr)

var dic: [String: Int] = ["Lee": 25]
print(dic["Lee"])

if let result = dic["Lee"] // 옵셔널 바인딩을 통한 값 추출
{
    print(result)
}

print(dic["Lee"]!)  //마지막에 느낌표를 붙이는 것은 강제 언래핑이라고 한다.

var set1: Set<Int> = [1, 2, 5, 0]
 
// 1. insert : 값을 추가하고, 추가된 결과를 튜플로 리턴 (중복이면 false, 추가된 값)
print(set1.insert(1))                // (false, 1)
print(set1)
print(set1.insert(10))               // (true, 10)
print(set1)

// 2. update : 값이 존재하지 않으면 추가 후 nil 리턴, 존재할 경우 덮어쓰기 후 덮어쓰기 전 값 리턴
print(set1.update(with: 1))   // Optioanl(1)
print(set1)
print(set1.update(with: 120))        // nil
print(set1)

//Day 2

func sayHello(name: String)
{
    print("Check #2 \(name)")
}
 
var name: String = "Kyusok"
sayHello(name: name)
name = "LeeKyusok"
print("Check #1 \(name)")

func sayHello2(name1: inout String) {
    name1 = "Kyumaker"
}
 
var name2: String = "LeeKyusok"
sayHello2(name1: &name2)
print(name2)

//가변 파라미터
func printSum(of nums: Int...) {}
printSum(of: 1, 2, 3, 4)

//파라미터가 있는 함수의 표기법 (Parameter Exists)
func toYou(name: String) {}
toYou(name:"LeeKS")
func toYou1(_ name: String) {}
toYou1(_ : "Hello")
func toYou2(to name: String) {}
toYou2(to: "Good")

//파라미터가 없는 함수의 표기법 (No Parameter)
func toYou3() {}
toYou3()

//함수를 상수에 대입
func funcDainyuu(name: String) {
    print("\(name)")
}
func funcDainyuu(_ name: String) {
    print("\(name)")
}
let f = funcDainyuu(name:)
f("Lee")




//Day 3


