# django_hello_world
Base project for medium.com articles

# Run the project

1. Create a `virtualenv`
    * ```virtualenv venv/```

2. Activate the `virutalenv`
   * Linux/MacOS: ```source venv/bin/activate```
   * Windows: ```source venv/bin/Script```
3. Install `requirements.txt`
   *  ```pip install -r requirements.txt```
4. Rename or copy `hello_world/example.env` to `hello_world/.env` 
    * ```cp hello_world/example.env hello_world/.env```
5. Run the project
   * ```python manage.py runserver```