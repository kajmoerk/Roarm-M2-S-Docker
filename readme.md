# Roarm-M2-S Docker Environment for Windows host
## Prerequisites:

- You need docker installed on your machine.
- First, check if your default wsl2 is not a Ubuntu distro (instead of the Docker-desktop distro)
  - You can check your default wsl by running the following command:
    - `wsl --list --verbose`
  - You can change it by running the following command:
    - `wsl --set-default Ubuntu-<version>`
- Then install and setup USBIPD on your host machine.
    - https://learn.microsoft.com/en-us/windows/wsl/connect-usb
    - You might also have to install linux-tools-generic && hwdata, if you are using Ubuntu.
      - `sudo apt-get install linux-tools-generic hwdata`
- After following the above steps, your usb devices should be available in your wsl2 distro.
  - Check this by running the following command:
    - `lsusb`
  - Normally it will be available at dev/ttyUSB0. You can check this by running the following command:
    - `ls /dev/ttyUSB*`

### Note:
While the usb is attached to the wsl2 distro, it will not be available on the host machine. You can detach the usb from the wsl2 distro by running the following command from the host machine:
  - `usbipd detach --busid <busid>`


## Run demo

- Build and run the docker container using the docker-compose file.
  - `docker-compose up --build`
- Then attach two shells to the running container.
- In both shells, navigate to the roarm_ws_em1 workspace, which is located at root.
  - `cd roarm_ws_em1`
- Source the install/setup.bash file in both shells.
  - `. install/setup.sh`
- Now in one of the shells, run the following:
  - `ros2 launch roarm roarm.launch.py`
- In the other one, run the serial_ctrl:
  - `ros2 run serial_ctrl serial_ctrl`
- You can check that the nodes are running by running the following command:
  - `ros2 node list`

