from flask import Flask
from flask import render_template
from flask import request
from flask import url_for

from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Column, String, Integer
from sqlalchemy.orm import sessionmaker

import json

Base = declarative_base()
class Question(Base):
    __tablename__ = 'question'


    id = Column(Integer, primary_key=True)
    name = Column(String)
    options = Column(String)
    answer = Column(String)

    def __init__(self, name, options, answer):
        self.name = name
        self.options = options
        self.answer = answer

    def __str__(self):
        return self.name.encode('utf-8') + self.options.encode('utf-8') + self.answer.encode('utf-8')

engine = create_engine("mysql://root:mysqlpassw0rd@localhost/safe-test?charset=utf8", encoding='utf-8')
Session = sessionmaker(bind=engine)
session = Session()

app = Flask(__name__)

def get_content(question):
    questions = session.query(Question).filter(Question.name == question)

    result = []
    for question in questions:
        options = json.loads(question.options)
        result.append((options, question.answer))

    return result

@app.route("/", methods=["POST", "GET"])
def hello():
    if request.method == "GET":
        print url_for("hello")
        questions = []
    else:
        question = request.form["question"]
        print type(question), question
        questions = get_content(question)
    return render_template("hello.html", questions=questions)

if __name__ == "__main__":
    app.run(debug=True, host="127.0.0.1", port=8089)
