#!/usr/bin/env python3

import yaml
import sys
import glob

filepattern = sys.argv[1]

for filename in glob.glob(filepattern):

    with open(filename, 'r') as f:
        data = yaml.load(f, Loader=yaml.FullLoader)

    with open(filename, 'w') as f:
        yaml.dump(data, f, default_flow_style=False)
