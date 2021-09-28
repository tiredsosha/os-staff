# Генерация ключей и добавление ключей в ssh-agent
ssh-keygen # надо просто несколько раз нажать энтер пока не появится многосимвольный ключ
set-service ssh-agent StartupType ‘Automatic’
Start-Service ssh-agent
ssh-add "C:\Users\hc\.ssh\id_rsa"
