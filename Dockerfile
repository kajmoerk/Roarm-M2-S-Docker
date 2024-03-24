FROM osrf/ros:humble-desktop

# Install colcon compile tool
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-colcon-ros \
    ros-humble-joint-state-publisher-gui \
    ros-humble-xacro \
    wget \
    unzip

# install python packages
RUN pip3 install \
    pyserial

# Install the waveshare Roarm ws package
RUN wget https://files.waveshare.com/wiki/RoArm-M2-S/Roarm_ws_em1.zip && \
    unzip Roarm_ws_em1.zip && \
    . /opt/ros/humble/setup.sh && \
    cd roarm_ws_em1 && \
    colcon build

RUN cd roarm_ws_em1 && \
    . install/setup.sh
