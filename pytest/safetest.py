# -*- coding=utf-8 -*-

from pyquery import PyQuery as pq
import urllib2
import re

from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Column, String
from sqlalchemy.orm import sessionmaker
from sqlalchemy.exc import IntegrityError

import json

Base = declarative_base()
class Question(Base):
    __tablename__ = 'question'

    name = Column(String, primary_key=True)
    options = Column(String)
    answer = Column(String)

    def __init__(self, name, options, answer):
        self.name = name
        self.options = options
        self.answer = answer

    def __str__(self):
        return self.name.encode('utf-8') + self.options.encode('utf-8') + self.answer.encode('utf-8')

def fetcher(url):
    resp = urllib2.urlopen(url)
    html = resp.read().decode('gb2312', 'ignore')
    return html

def retryOnURLError(trycnt=3):

    def funcwrapper(fn):
        def wrapper(self, *args, **kwargs): # 怎么function wrapper还有个self参数
            for i in range(trycnt):
                try:
                    return fn(self, *args, **kwargs)
                except urllib2.URLError, e:
                    print("retry %s time(s)" % (i + 1))
                    if i == trycnt - 1:
                        raise e
        return wrapper

    return funcwrapper


engine = create_engine("mysql://root:baixing@localhost/safe_test?charset=utf8", encoding='utf-8')
Session = sessionmaker(bind=engine)
session = Session()

p = re.compile(r'^[0-9]+、\s*(?P<question>.+)$', re.UNICODE)

types = [
    #(1436, 77), # 题库编号，一共页数
    (1485, 19),
    (1467, 37),
    (1471, 82),
    (1484, 27),
    (1486, 12),
]

fetchfn = retryOnURLError()(fetcher)
for t, max_page in types:
    for page in range(1, max_page):

#t = 1436
#page = 5
        url = 'http://regi.zju.edu.cn/redir.php?catalog_id=6&cmd=learning&tikubh=' + str(t) + '&page=' + str(page)
        html = fetchfn(url)
        d = pq(html)
        divs = d('div.shiti')

        for div in divs:
            item = d(div)

            # 提取question
            q = item('h3').eq(0).text()
            m = p.match(q.encode('utf-8'))
            if not m:
                print q, page
                continue
            question = m.group('question')

            # 提取选择
            options = item('li label')
            os = []
            for option in options:
                os.append(d(option).text().encode('utf-8'))
            os = json.dumps(os)

            # 提取答案
            answer = item.next().text()

            # 插入数据
            #with engine.connect() as conn:
                #cmd = "insert into question(`name`, `options`, `answer`) values('%s', '%s', '%s')" % (question, os, answer.encode('utf-8'))
                #print cmd
                #result = conn.execute(cmd.encode)
            if not answer:
                print html
                exit(0)

            que = session.query(Question).get(question)
            if que:
                print que
                continue
                #_os = json.loads(question.options)
                #question.options = json_dumps(_os + json.loads(os))

            question = Question(question, os, answer)
            session.add(question)

        try:
            session.commit()
        except IntegrityError as e:
            print e
        except Exception as e:
            session.rollback()
            print page
            raise e
