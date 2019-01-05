# 
ssh root@steponmy.com "git clone http://github.com/maxspad/dock-datasci"
scp -r .\secrets root@steponmy.com:~/dock-datasci/secrets 
ssh root@steponmy.com "cd ~/dock-datasci && docker-compose up -d --build"
echo "Server should be running!"