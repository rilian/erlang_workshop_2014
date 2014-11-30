Erlang Workshop 2014
---

1) install erlang, kvs, mad, rebar

2) put mad, rebar to PATH


3) get source code

```
git clone https://github.com/5HT/n2o.git
cd n2o/samples
mad dep

cd ../..

git clone https://github.com/rilian/erlang_workshop_2014.git
cd erlang_workshop_2014
cp -r ../n2o/samples/deps .

mad compile

mad repl

```

4) open http://127.0.0.1:8000/login