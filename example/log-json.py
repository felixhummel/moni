#!/usr/bin/env python
# encoding: utf-8
import json
import random
import string
import time

LEVELS = ['INFO', 'WARNING', 'ERROR', 'FATAL']
CHARS = string.ascii_uppercase + string.digits

while True:
    d = dict(
      level=random.choice(LEVELS),
      msg=''.join(random.choices(CHARS, k=10)),
    )
    print(json.dumps(d))
    time.sleep(1)
