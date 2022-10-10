
# Python program to read
# json file

import json
import logging
from jinja2 import Template
import os

def get_template_values():
    # Opening JSON file
    template_path = os.getcwd() + "/metrics.json"
    f = open(template_path)

    # returns JSON object as
    # a dictionary
    data = json.load(f)
    f.close()
    return data

def render_alarm_template():
    template_path = os.getcwd() + "templates/alarms.j2'

    with open(template_path) as fh:
        alarm_template = Template(fh.read())

    output = alarm_template.render(alarm_name="test",
                                topic_name="test_topic"
                                ).replace('\n\n\n', '\n\n')

def render_metric_template():
    data = get_template_values()
    template_path = os.getcwd() + "templates/alarms.j2'

    with open(template_path) as fh:
        topic_template = Template(fh.read())

    output = topic_template.render(alarms=data).replace('\n\n\n', '\n\n')
    os.system("mkdir -p tf-output")
    file = os.getcwd() + "/tf-output/main.tf"
    f = open(file, "w")
    f.write(output)
    f.close()
    
render_metric_template()
