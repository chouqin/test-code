# -*- coding=utf-8 -*-

import requests

def get_cookies():
    cookies = {}
    with open('./cookies.txt') as f:
        while True:
            key = f.readline().strip()
            if not key:
                break
            value = f.readline().strip()
            f.readline()
            #print key, value
            cookies[key] = value

    return cookies

cookies = get_cookies()
headers = {
    'referer': 'http://guahao.zjol.com.cn/DepartMent.Aspx?hosid=057101&depname=%e4%ba%a7%e7%a7%91%e9%97%a8%e8%af%8a' #根据不同的科室和医院不一样
}

def get_gethy():
    data = {
        'sg': 'D212ECB56EBF735C6729503CD7B22C330F656FAFB1C645224CDDD4A3BC4318E67A3671F7494D814D9D1A40036FDD8002DA5DA9661963B277ACE2AE3F7ACA5BB79F38AD8672888257032DEAECAAFFB32EB3925E86DDB94B40'
    }
    url = 'http://guahao.zjol.com.cn/ashx/gethy.ashx' #获取预约号
    r = requests.post(url, data=data, cookies=cookies, headers=headers)
    print r.status_code, r.text
    return r.text

def parse_gethy(result):
    contents = result.split('#')
    for idx, val in enumerate(contents):
        print idx, val
    candidates = contents[11].split('$')
    if len(candidates) < 0: # 如果全部预约完，直接返回
        print '没有预约空闲'
        exit(0)
    candidate = candidates[-1].split('|')
    sg = contents[12]
    return candidate, sg

def yuyue(candidate, sg):
    data = {
        'f85ef28': candidate[0], #这个前面的变量名也会变的啊啊啊，需要改
        'yzm': '5dn4rf', #手动填入的验证码
        'xh': candidate[1],
        'qhsj': candidate[2],
        'sg': sg,
    }
    url = 'http://guahao.zjol.com.cn/ashx/TreadYuyue.ashx' #预约
    r = requests.post(url, data=data, cookies=cookies, headers=headers)
    print r.status_code, r.text

candidate, sg = parse_gethy(get_gethy())
yuyue(candidate, sg)
