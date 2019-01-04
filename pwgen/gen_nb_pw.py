from notebook.auth import passwd
pw = passwd()
with open('nbpw.txt','w') as f:
    f.write(pw)
print('Left hashed password in "nbpw.txt"')
