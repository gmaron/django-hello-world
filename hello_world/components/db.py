import os

DATABASES = {
    'default': {
        'ENGINE': os.getenv("DB_ENGINE"),
        'HOST': os.getenv("DB_HOST"),
        'PORT': os.getenv("DB_PORT"),
        'USER': os.getenv("DB_USER"),
        'PASSWORD': os.getenv("DB_PASS"),
        'NAME': os.getenv("DB_NAME"),
    }
}
