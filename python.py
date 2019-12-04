print("Python")

#この部分はコメントアウトされます。

'''
print(コメントアウトされている)
print(コメントアウト)
'''

"""
print(コメントアウトされている)
print(コメントアウト)
"""

value = "Hello World!"
print(value)

print("Pythonではシングルクオーテーションもダブルクオーテーションも違いがありません。")

num = 7
print(num)

num=3.14
print(num)

yes = True
print(yes)

no = False
print(no)

print("True,Falseの大文字である必要があります。")

tuple = ('a',5,3.14)
print(tuple)
#Pythonでタプルを記述する場合には、変数名 = (変数, 変数, 変数,...)のように()を用いて記述します。
print("タプルとは変数のセットを格納するための型の一つです。例題のように様々な型の変数を格納することができます。タプルは格納した変数のセットを変更することができません。")
print(tuple[0])
print("タプルは一度定義すると、tuple[1] = 'c'のように要素を変更(再代入)することができません。")

list = ['a','b','c']
print(list)
print("リストもタプルと同様に様々な型の変数を格納することができます。リストは定義後に要素を変更(再代入)することが可能です。")
dict = {"key1":"value1","key2":"value2"}
print(dict)
'''
Pythonでディクショナリ(辞書)型を記述する場合には、
{"key": "value", ...}のように{}を用いて記述します。

タプル、リストでは要素を取得する際にlist[1]のように数字をインデックスとしていましたが、ディクショナリ型ではキーと呼ばれる識別子を用いて要素を取得します。
他の言語では連想配列やMapなどと呼ばれているものと同等の型です。
'''
print(dict["key2"])

cal = 5.0 / 2
print(cal)  #2.5

cal = 2**3
print(cal) #2^3=8

str1 = "Hello"
str2 = "World"
str = str1+str2
print(str)

a=5
b=2+3
if a==b:
    print("条件がTrueのとき表示されます。")
    else:
    print("条件がFalseのときに表示されます。")

if a==b:
    print("条件がTrueのとき表示されます。")
    elif a==b+1:
    print("a==b+1がTrueのときに表示されます。")

print("この行は条件がに関わらず表示されます。")

list = [1,2,3,4,5]
for i in list:
    print(i)

print("この行は繰り返しの処理が終わったら表示されます。")

i = 0
while i <5:
    print(i)
    i += 1

print("この行は繰り返しの処理が終わったら表示されます。")

def func():
    print("func")

"""
def 関数名():
    関数の処理
"""
func()

def add(a,b):
    return a+b

res = add(3,8)
print(res)

class Car:
#    pass
#pass文は何もしないという処理の文です。Pythonでは:の次の行はインデントされたブロックを記述しなければならないので、Carクラスを記述するためにpass文を用いています。
    def __init__(self):
        #fuel:燃料,distance:走行距離
        #最初は燃料、走行距離ともに0で初期化しましょう。
        self.fuel = 0
        self.distance = 0
        """
        __init__(self)という関数は、クラスが実際に使われるときに自動的に呼ばれる初期化関数です。引数にselfをもっていますが、これはクラスの実体そのものを表します。
        """
    def charge(self,fuel):
        self.fuel += fuel
        # pass
    #クラス内部の関数をメンバ関数と呼びます。メンバ関数も通常の関数と同様にdefを用いて定義しますが、メンバ関数の第一引数には常に自身のインスタンスが渡されます。この自身のインスタンスの変数名をselfとします。
    def run(self):
        #まずは燃料があるかを確認します。
        if self.fuel > 0:
            #fuelを1消費してdistanceを1増やす
            self.fuel -= 1
            self.distance += 1
            print("走行距離は{}です。".format(self.distance))
            else:
                #燃料がない場合にこのブロックの処理を行います。
                #燃料がない事を表示します。
                print("燃料がありません。")

car = Car()
print("燃料: {}".format(car.fuel))  #燃料： 0
print("走行距離: {}".format(car.distance))  #走行距離: 0