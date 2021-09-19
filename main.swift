//
//  main.swift
//  SwiftBasic
//
//  Created by Lee's Pc on 2021/09/17.
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
print("\(dic["odd"]!) + 은 강제언래핑") //Forced Unwrapping
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
// 이 경우에는 위에서의 ints3의 출력에서의 변형으로, 위에서 출력시켰던 딕셔너리에서 .values를 붙여서 값의 count값만을 갖는 배열로 출력시켜준다.
let ints5 = countries2.mapValues{$0}
print(ints5)
// 이 경우에는 그냥 딕셔너리의 출력과도 같다.
print(countries2)
// 위의 값과 동일 (딕셔너리의 단순 출력)

//Day 5　9月19日の勉強
//프로그래머스 위장 swift
//Programmers Disguise (Swift)
func solution(_ clothes:[[String]]) -> Int {
    var dic = [String:[String]]()
    for c in clothes{
        if dic[c[1]] != nil{
            dic[c[1]]!.append(c[0])
        } else {
            dic[c[1]] = [c[0]]
        }
    }
    
    let count = dic.mapValues{$0.count}.values
    return count.reduce(1){$0*($1+1)} - 1
}

print(solution([["yellowhat", "headgear"], ["bluesunglasses", "eyewear"], ["green_turban", "headgear"]]))

// 알고리즘 해석
// print(solution([~~~])에서 clothes[0]은["yellowhat", "headgear"]에 해당
// func solution 내부에서의 for문의 c라는 상수는 clothes[0]부터 시작하게 됨. 즉, 여기서의 c[1]은 사실은 clothes[0][1]이 들어간다는 뜻!
// 위의 알고리즘을 그대로 따라가면은, dic을 빈 배열로 초기화해주었기에 아무 요소(키 : 값)가 없는 상황이다.
// for문이 시작될때, clothes[0][1]부터 시작이 되는데 (c라는 상수자체가 clothes[0] 부터 시작하기에), 그렇게 되면 처음에는 dic[c[1]] 은 nil 이기에 else문을 따라가게 된다.
// 그렇게되면, 의상의 종류를 키값으로 해당 의상의 종류(이것이 값이 됨)가 담긴 배열을 만들어준다. 즉, ["yellowhat", "headgear"]에서 headgear를 키로하는 배열을 만든다. 이때, headgear를 키값에 yellowhat이 들어가게 된다.
// 다음으로 for문의 반복에 의해, clothes[1][1]이 대입되어 for문이 실행되는데, eyewear를 키로 하는 딕셔너리가 아직 없는 관계로 else문을 실행 후 eyeswear를 키로 하는 배열을 만든 후, 이 키에 bluesunglasses를 값으로서 대입하게 된다.
// 다음의 for문 반복은 clothes[2][1]이 대입되어 실행된다. 이때, c[1], 즉 clothes[2][1]은 headgear이다. 좀 전에 위에서 headgear를 키로하는 딕셔너리를 만들었기에, dic[c[1]] 은 존재한다는 것을 알 수 있다. 즉, for문의 if문, dic[c[1]] != nil (해당 딕셔너리가 nil이 아니고 이미 존재하기에) 이 실행된다. 이때, 해당 의상의 종류를 키로 하는 딕셔너리에 해당 배열의 이름이 값으로 추가되게 된다. 그렇기에 [String : [String]]으로 만든것이지.. (의상의 종류는 한정되어도, 의상의 이름은 여러가지가 될 수 있으니)
// for문은 clothes배열의 종류만큼 진행하기에 이걸로 for문은 종류가 된다. 

let asiaKuni: [String] = ["Korea", "Japan", "China", "Taiwan", "Russia"]
for i in asiaKuni {
    print(i)
}

for j in 0..<asiaKuni.count {
    print(j)
    let eastAsia = asiaKuni[j]
    print(eastAsia)
}

//프로그래머스 베스트앨범 swift 고득점Kit
//Programmers BestAlbum (Swift)

func solution(_ genres: [String], _ plays: [Int]) -> [Int] {
    var genrePlay: [String:Int] = [:]
    var indexInGenre: [String:[Int]] = [:]
    
    for i in 0..<genres.count {
        let genre = genres[i]
        let play = plays[i]
        
        if let playsCount = genrePlay[genre] {
            genrePlay[genre] = play + playsCount
        } else {
            genrePlay[genre] = play
        }
        
        if indexInGenre[genre] != nil {
            indexInGenre[genre]!.append(i)
        } else {
            indexInGenre[genre] = [i]
        }
        
    }
    
    
    var answer: [Int] = []
    return answer
}

