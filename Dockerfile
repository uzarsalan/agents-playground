# устанавливаем официальный образ Node.js
FROM node:19-alpine

# указываем рабочую (корневую) директорию
WORKDIR /app

# копируем основные файлы приложения в рабочую директорию
COPY . ./

# устанавливаем указанные зависимости NPM на этапе установки образа
RUN npm install

ENV NEXT_PUBLIC_LIVEKIT_URL "wss://test-app-mtzuxrmx.livekit.cloud"

RUN npm run build

# запускаем основной скрипт в момент запуска контейнера
CMD npm run start