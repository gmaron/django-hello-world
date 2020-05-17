import os

# DJANGO_HELLO_WORLD SECRETS

## BASE ENVIRONMENT VARS
os.environ['SECRET_KEY'] = 'secret_key'
os.environ['ALLOWED_HOST_DOMAIN'] = 'localhost:8000'

# DATABASE ENVIRONMENT VARS
os.environ['DB_HOST'] = 'localhost'
os.environ['DB_PORT'] = '3306'
os.environ['DB_USER'] = 'db_user'
os.environ['DB_PASS'] = 'db_pass'
os.environ['DB_NAME'] = 'db_name'
os.environ['DB_ENGINE'] = 'django.db.backends.mysql' # for mysql engine. 

# OTHER APP ENVIRONMENT VARS
# ...
