# NemoMatlab
主要包含Nemo的matlab外围子程序，用于日常的仿真和数据处理：

1.  spiltData：将存储的bin文件，划分成16个小段，数据格式为 nX4的矩阵，分别对应4个通道的数据，程序会默认显示并保存该段信号的时域和时频图，最终将信号存储为.mat文件
2.  covert2CCSbin：原始数据不宜用于CCS仿真，利用matlab将数据保存为CCS仿真需要的格式，并保存。
