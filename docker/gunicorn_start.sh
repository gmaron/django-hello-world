NAME="django_hello_world"                               # Name of the application
DJANGODIR=$APP_HOME                                     # Django project directory
SOCKFILE=$APP_HOME/run/gunicorn.sock                    # Communication through this socket
USER=root                                               
GROUP=root
NUM_WORKERS=10                                          # Workers to be spawned by Gunicorn
DJANGO_SETTINGS_MODULE=hello_world.settings             # Settings file to be used by Django
DJANGO_WSGI_MODULE=hello_world.wsgi                     # WSGI module name

echo "Starting $NAME as `whoami`"

# Activate the virtual environment
cd $DJANGODIR
export DJANGO_SETTINGS_MODULE=$DJANGO_SETTINGS_MODULE
export PYTHONPATH=$DJANGODIR:$PYTHONPATH

# Create the run directory if it doesn't exist
RUNDIR=$(dirname $SOCKFILE)
test -d $RUNDIR || mkdir -p $RUNDIR

# Start your Django Gunicorn
# Programs meant to be run under supervisor should not daemonize themselves (not use --daemon)
exec gunicorn ${DJANGO_WSGI_MODULE}:application \
    --name $NAME \
    --workers $NUM_WORKERS \
    --user=$USER --group=$GROUP \
    --bind=unix:$SOCKFILE \
    --log-level=debug \
    --log-file=- \
    --timeout 120