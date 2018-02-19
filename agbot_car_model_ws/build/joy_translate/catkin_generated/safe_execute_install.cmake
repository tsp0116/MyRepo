execute_process(COMMAND "/home/agbot/agbot_car_model_ws/build/joy_translate/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/agbot/agbot_car_model_ws/build/joy_translate/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
