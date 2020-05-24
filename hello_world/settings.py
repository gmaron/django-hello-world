from split_settings.tools import optional, include
import os
from os import environ

ENV = environ.get("DJANGO_ENVIRONMENT") or 'development'

DEBUG = False if ENV == 'production' else True

base_settings = [
    os.path.join('environment', '{0}.py'.format(ENV)),
    os.path.join('components', '*.py'),
    
    # for any local settings
    optional('local_settings.py')
]

include(*base_settings)
