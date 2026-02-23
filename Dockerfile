FROM steebchen/nginx-spa:stable
LABEL authors="ali"
WORKDIR /app
COPY ./dist ./
EXPOSE 80
CMD ["nginx"]