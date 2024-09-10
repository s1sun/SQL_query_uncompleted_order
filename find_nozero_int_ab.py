#!/bin/python3
# sean sun
"""
Given an integer N, you want to find positive intyegers A and B such that:
   * A + B = N;
   * neither A and B contains any 0 in this decimal representation.
Write a function:
     def solution(N)
that, given an integer N, return a two-element array containing A and B, which fulfills the criteria described above.
Example:
1. Given N =12, your function may returns [7,5]. Some other valid could be [5,7],[6,6],[4,8],[8,4]. It may not return [10,2], as the first number in this pair contains a zero.
2. Given N =104, your function may returns [31,73]. Some other valid could be [62,42],[42,62]. It may not return [50,54] or [104,0] though.
3. Given N =200, your function may returns [134,66]. 
4. Given N =3, your function may returns [2,1].
Assume that:
   * N is an integer within the range[2, 500,000]
In your solution, focus on correctness. The performance of your solution will not be the focus of the assessment.
Python3 code below:
# you can write to stdout for debugging purposes, e.g.
# print("this is a debug message")
"""

def solution(N):
  pair = []
  for A in range(1, N):
      B = N-A
      if not '0' in str(A) and not '0' in str(B):
          return [A, B]
  return pair

if __name__ == '__main__':
    Ns = list(map(int, input().rstrip().split()))
    for N in Ns:
        result = solution(N)
        print(result)
