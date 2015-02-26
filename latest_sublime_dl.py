#! /usr/bin/python
import requests
from lxml import etree
tree=etree.HTML(requests.get('http://www.sublimetext.com/3').text)
print tree.xpath("//li[@id='dl_linux_64']/a/@href")[0]