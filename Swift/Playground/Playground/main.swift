/*
Q. 1번째부터 333번째 소수까지를 모두 출력하세요.

- 소수는 1보다 큰 자연수 중 1과 자기 자신만을 약수로 가지는 수로, 2, 3, 5, 7, 11 등이 소수에 해당합니다.
- 약수는 어떤 수를 나누어 나머지가 없이 떨어지는 수로, 예를 들어 8의 약수는 1, 2, 4, 8입니다.

(출력결과: 1번째부터 333번째까지 소수는 [n, n, n, n...(생략)...n, n]입니다.)
 */

 import Foundation

func isPrime(num: Int) -> Bool {
  let sqrt = Int(sqrt(Double(num)))
  if num < 2 {
    return false
  } else if num == 2 || num == 3{
    return true
  }
          
  for n in Range(2...sqrt) {
    if num % n == 0 {
      return false
    }
  }
  
  return true
}

func question08() {
  var prime: [Int] = []
  var number: Int = 0

  while prime.count != 333 {
    if isPrime(num: number) {
      prime.append(number)
    }
    number += 1
  }

  print("1번째부터 333번째까지 소수는 \(prime)입니다.")
    
    
}

question08()
