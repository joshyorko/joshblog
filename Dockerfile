FROM klakegg/hugo:latest

WORKDIR /src
COPY . .

EXPOSE 1313

CMD ["server", "-D", "--bind", "0.0.0.0"]
