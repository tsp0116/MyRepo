#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
    DESTDIR_ARG="--root=$DESTDIR"
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/agbot/agbot_car_model_ws/src/joy_translate"

# snsure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/agbot/agbot_car_model_ws/install/lib/python2.7/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/agbot/agbot_car_model_ws/install/lib/python2.7/dist-packages:/home/agbot/agbot_car_model_ws/build/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/agbot/agbot_car_model_ws/build" \
    "/usr/bin/python" \
    "/home/agbot/agbot_car_model_ws/src/joy_translate/setup.py" \
    build --build-base "/home/agbot/agbot_car_model_ws/build/joy_translate" \
    install \
    $DESTDIR_ARG \
    --install-layout=deb --prefix="/home/agbot/agbot_car_model_ws/install" --install-scripts="/home/agbot/agbot_car_model_ws/install/bin"
