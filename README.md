# NemoMatlab
主要包含Nemo的matlab外围子程序，用于日常的仿真和数据处理：

1.  spiltData：将存储的bin文件，划分成16个小段，数据格式为 nx4的矩阵，分别对应4个通道的数据，程序会默认显示并保存该段信号的时域和时频图，最终将信号存储为.mat文件
2.  covert2CCSbin：原始数据不宜用于CCS仿真，利用matlab将数据保存为CCS仿真需要的格式，并保存。


It mainly contains Nemo's matlab peripheral subroutines for daily simulation and data processing.

spiltData: The stored bin file will be divided into 16 segments, and the data format is nx4 matrix, which corresponds to the data of 4 channels. The program will display and save the time domain and time frequency map of the segmented signal by default, and finally store the signal as a .mat file.
covert2CCSbin: The raw data is not suitable for CCS simulation, use matlab to save the data in the format required for CCS simulation and save it.
