import cv2
import numpy as np
import os
from math import copysign, log10
import xlsxwriter
import matlab
import matlab.engine
import sys

sys.path.append(r'C:\Users\dotua\AppData\Roaming\Python\Python37\site-packages\matlab.py')

FilenameExcel = 'huMoments.xlsx'
FolderSaveExcel = r'F:\BKDN\Ky-Thuat-Nhan-Dang\Data\Humoment'
FolderImage = r'F:\BKDN\Ky-Thuat-Nhan-Dang\Data\GoldenFishSegmentation'


if __name__ == '__main__':
	eng = matlab.engine.start_matlab()
	#eng.edit('run',nargout=0)
	workbook = xlsxwriter.Workbook(os.path.join(FolderSaveExcel,FilenameExcel))
	worksheet = workbook.add_worksheet() 
	for row, filename in enumerate(os.listdir(FolderImage)):
		if row > 0:
			break
		image = cv2.imread(os.path.join(FolderImage, filename), cv2.IMREAD_UNCHANGED)
		image = image // 255
		#moment = cv2.moments(image)
		#huMoments = cv2.HuMoments(moment)
		huMoments_log = eng.run(image)
		for coln in range(0,7):
			#value = -1*copysign(1.0,huMoments[coln])*log10(abs(huMoments[coln]))
			value = huMoments_log[coln]
			worksheet.write(row, coln, value)
		category = ''
		for idx in range(1,7):
			if idx == int(filename.split('-')[0]):
				category += '1'
			else:
				category += '0'
		worksheet.write(row, 7, category)
	workbook.close() 