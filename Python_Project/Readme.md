from random import sample

//定義N

N = [1,2,3,4,5,6,7,8,9]

//選出不重複的四個數字
  sample(範圍,選幾個出來）

a = sample(N,1)

//因為是4位數，首位不能為0

N.remove(a[0])

N.append(0)

d = sample(N,3)

for j in range(0,3):

    a.append(d[j])


//一開始顯示的文字

b = int(input('請猜一個無重複的四位數字: '))


//你輸入的四位數

blist = [int(x) for x in str(b)]


//定義A，當你輸入的數字對且位子正確的時候，d1 +1，顯示Ad1(d1為數字)

def A(blist):

    d1 = 0
    
    for i in range(0,4):
    
        if (blist[i] == a[i]) :
        
            d1 += 1
            
    return d1
    

//定義B，當你輸入的數字對但位子不對的時候，d2 +1，顯示Bd2(d2為數字)

def B(blist):

    d2 = 0
    
    for i in range(0,4):
    
        if (blist[i] in a and blist[i] != a[i]) :
        
            d2 += 1
            
    return d2
    

//當d1=4時，代表全部猜對，顯示Correct!，結束遊戲

  如果d1不等於4，顯示"請猜一個無重複的四位數字"，遊戲繼續
  
while True :

    if A(blist) == 4 :
    
        print("Correct!")
        
        break
        
    else:
    
        print("Guess: %d" %b,"Result: %dA%dB" % (A(blist),B(blist)))
        
        b = int(input("請猜一個無重複的四位數字: "))
        
        blist = [int(x) for x in str(b)]
