from random import sample

N = [1,2,3,4,5,6,7,8,9]
a = sample(N,1)
N.remove(a[0])
N.append(0)
d = sample(N,3)
for j in range(0,3):
    a.append(d[j])


b = int(input('請猜一個無重複的四位數字: '))

blist = [int(x) for x in str(b)]


def A(blist):
    d1 = 0
    for i in range(0,4):
        if (blist[i] == a[i]) :
            d1 += 1
    return d1

def B(blist):
    d2 = 0
    for i in range(0,4):
        if (blist[i] in a and blist[i] != a[i]) :
            d2 += 1
    return d2


while True :
    if A(blist) == 4 :
        print("Correct!")
        break
    else :
        print("Guess: %d" %b,"Result: %dA%dB" % (A(blist),B(blist)))
        b = int(input("請猜一個無重複的四位數字: "))
        blist = [int(x) for x in str(b)]