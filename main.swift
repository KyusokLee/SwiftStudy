//
//  main.swift
//  SwiftBasic
//
//  Created by Lee's Pc on 2021/09/21.
//

import Foundation

//Day 4 9月16~18日の勉強
let nums: [[Int]] = [[1, 4], [2, 5], [3, 9], [4, 7, 8]]
print(nums[0])
for num in nums {
    print(num)
}
for num in nums {     // num이라는 상수자체에 num[0]이 들어가고 num[1]...이 들어가는 반복문이다. 즉, 여기서num[0]이라고 적으면 num[0][0], num[1][0], num[2][0]...이렇게 반복되는 것이다. 중요!
    print(num[0])
}

for num in nums {
    print(num[1])
}



let evenNums = [2,4,6]
let oddNums = [1,3,5,7]
let dic : [String:[Int]] = ["even" : evenNums, "odd" : oddNums] //String 과 int배열
print(dic["odd"]!) //Forced Unwrapping 강제 언래핑
print(dic["odd"] ?? "None") //IOU 암시적추출

//map and mapValues (in Dictionary)
//map 이랑 mapValues의 차이점 (Dictionary에서의)

//map은 배열로 출력시켜준다. 단, map의 뒤에 {$0}만 쓸 경우는, key가 무엇인지, value가 무엇인지 나타내주는 딕셔너리랑 비슷한 꼴의 배열을 출력해준다
let mapCountries = [
    "US": "United States",
    "BE": "Belgium",
    "CN": "China"
]

let intsCount1 = mapCountries.map{$0}
print(intsCount1)
// ******** map의 뒤에 {$0}만 쓸 경우는, key가 무엇인지, value가 무엇인지 나타내주는 딕셔너리랑 비슷한 꼴의 배열을 출력해준다*****
let intsCount2 = mapCountries.map { $0.value.count }
print(intsCount2)
// 위의 부연설명: {$0.value.count} 이기에 Value에 해당하는 값의 글자수를 count하여 int값으로 변형시킨후, 배열로 출력시켜준다.
let ints = mapCountries.map{$0.value}
print(ints)
// 위의 부연설명: {$0.value} 자체가 값의 요소들의 값자체를 출력시켜준다. 이 또한, 배열로 출력시켜준다.

// ****** mapValues는 딕셔너리의 값만 변환시키며 배열이 아닌 딕셔너리로 출력시켜준다. ******
let countries1 = [
    "US": "United States",
    "BE": "Belgium",
    "CN": "China"
]

let ints2 = countries1.mapValues { $0.count }
print(ints2)
// mapValues{$0.count}는 key는 그대로 출력시켜주고, 그 key에 해당하는 value를 count해준다. String이기에 글자수를 카운트시켜준다.

let countries2: [String:[String]] = [
    "A": ["Apple", "Amazon", "Amazing"],
    "B": ["Banana", "Boss"],
    "C": ["Canada", "Cat", "Cheese", "Coffee"]
]

let ints3 = countries2.mapValues{$0.count}
print(ints3)
// 여기에서는 딕셔너리가 [String:[String]]이기에 Value에 들어갈 수 있는 것이 요소들의 배열이 되게 된다. 즉, 그 키에 해당하는 값에 있는 요소의 수를 count해서 숫자(int)로 변형시켜준다. 키와 값을 둘다 출력하는 딕셔너리형식으로 반환된다.
let ints4 = countries2.mapValues{$0.count}.values //mapValues에만 뒤에 .values 가능
print(ints4)
// 이 경우에는 위에서의 ints3의 출력에서의 변형으로, 위에서 출력시켰던 딕셔너리에서 .values를 붙여서 값의 count값만을 갖는 배열로 출력시켜준다. 즉, 키가 없는 값만 출력됨.
var ints4_1 = countries2.mapValues{$0.count}.keys
print(ints4_1)
// 위의 설명에 이어서 키만을 얻고 싶다면, mapValues { ~ }.keys를 하면 된다.
let ints5 = countries2.mapValues{$0}
print(ints5)
// 이 경우에는 그냥 딕셔너리의 출력과도 같다.
print(countries2)
// 위의 값과 동일 (딕셔너리의 단순 출력)


let asiaKuni: [String] = ["Korea", "Japan", "China", "Taiwan", "Russia"]
for i in asiaKuni {
    print(i)
}

for j in 0..<asiaKuni.count {
    print(j)
    let eastAsia = asiaKuni[j]
    print(eastAsia)
}

