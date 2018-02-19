#!/usr/bin/env python
import rospy
from sensor_msgs.msg import Joy
from ackermann_msgs.msg import AckermannDrive

turning = 0
linear = 0


def callback(data):
    global turning
    global linear
    rospy.loginfo("%s, %s", data.axes[2], data.axes[1])
    turning = data.axes[2]
    linear = data.axes[1]

def joyTranslate():

    pub_left = rospy.Publisher('ackermann_cmd', AckermannDrive, queue_size = 10)
    rospy.init_node('joyTranslate', anonymous=True)
    rate = rospy.Rate(20)
    rospy.Subscriber("joy", Joy, callback)

    while not rospy.is_shutdown():
        pub_left.publish(turning,0,linear,0,0)
        rate.sleep()

if __name__ == '__main__':
    joyTranslate()


    # /ackermann_cmd [ackermann_msgs/AckermannDrive]
    # ['steering_angle', 'steering_angle_velocity', 'speed', 'acceleration', 'jerk']


