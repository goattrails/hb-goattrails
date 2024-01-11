---
title: "{{ replace .Name "-" " " | title }}"
date: {{ .Date }}
publishDate: {{ .Date }}
# expiryDate: {{ .Date }}
draft: true
description: "{{ replace .Name "-" " " | title }}"
noindex: false
featured: false
pinned: false
# authors:
#  - ich
# comments: false
series:
#  -
categories:
#  -
tags:
#  -
images:
#  -
# menu:
#   main:
#     weight: 100
#     params:
#       icon:
#         vendor: bs
#         name: book
#         color: '#e24d0e'
---

Content.
