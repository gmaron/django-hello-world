import os

# DJANGO_HELLO_WORLD SECRETS

## BASE ENVIRONMENT VARS
os.environ['SECRET_KEY'] = 'secret_key'
os.environ['ALLOWED_HOST_DOMAIN'] = 'localhost:8000'

# OTHER APP ENVIRONMENT VARS
# ...
