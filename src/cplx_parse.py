import csv
import matplotlib.pyplot as plt

which = '01'
fileName = 'rtt_' + which
fileName2 = 'processed_' + which
#threshold = 10000000
threshold = 1000
rtt = []
dict = {}
with open(fileName, 'r') as csv_file:
	csv_reader = csv.DictReader(csv_file, delimiter=',')
	with open(fileName2, 'w') as csv_file2:
		fieldNames = ['saddr', 'rtt']
		csv_writer = csv.DictWriter(csv_file2, delimiter=',', fieldnames=fieldNames)
		csv_writer.writeheader()
		for line in csv_reader:
			ip = line['saddr']
			type = float(line['type'])
			code = float(line['code'])
			rtt = (float(line['timestamp_ts']) - float(line['sent_timestamp_ts'])) * 1000 + (float(line['timestamp_us']) - float(line['sent_timestamp_us'])) / 1000
			rtt = round(rtt, 3)
			if (code == 0 and rtt <= threshold):
				csv_writer.writerow({'saddr':ip, 'rtt':rtt})


