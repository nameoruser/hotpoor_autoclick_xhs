import os
import time

device_id = "3ef669820521"
num = 0
click_type = "news"
while True:
    print("点击次数:%s"%(num))
    os.system("adb -s %s shell input tap 80 1050"%(device_id))
    time.sleep(3)
    if click_type in ["news"]:
        os.system("adb -s %s shell input tap 70 150"%(device_id))
        time.sleep(2)
    else:
        break
    num +=1
    if num%10 == 1:
        print("刷新数量")
        os.system("adb -s %s shell input swipe 600 625 600 1825 1000"%(device_id))
        time.sleep(2)