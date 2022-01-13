#sudo ./zmap -P 5 -p 1434 -M udp  --probe-args=hex:02 -n 10000 -u zmap.txt --output-file=test 
#sudo ./zmap -p 1434 -M udp  --probe-args=hex:02 -n 500000  --sender-threads=1 -u zmap.txt
#sudo ./zmap -p 443 -M tcp_synscan -P 4000000 127.0.0.1 

#sudo ./zmap  -p 1434 -M udp --probe-args=hex:02   -n 500000   -u zmap.txt   --output-file=test_test --output-module=csv --output-fields="saddr,icmp_timestamp,icmp_elapsed,icmp_rtt"  --metadata-file=metadata #--probe-ttl=10

#sudo ./zmap 101.133.156.128 -P 100000 -p 1434 -M udp --probe-args=hex:02   -n 1000000   -u zmap.txt   --output-file=test_server_100000 --output-module=csv --output-fields="saddr,icmp_timestamp,icmp_elapsed,icmp_rtt"  --metadata-file=metadata #--output-filter="repeat = 0 || repeat = 1"

#sudo ./zmap 62.224.184.8 -P 400 -p 1434 -M udp --probe-args=hex:02   -n 1000000   -u zmap.txt   --output-file=test_server_62 --output-module=csv --output-fields="saddr, icmp_timestamp, icmp_elapsed, icmp_rtt"  --metadata-file=metadata #--output-filter="repeat = 0 || repeat = 1"

#sudo ./zmap 169.254.240.60 -P 4000 -p 1434 -M udp --probe-args=hex:02   -n 1000000   -u zmap.txt   --output-file=test_server --output-module=csv --output-fields="saddr, icmp_code"  --metadata-file=metadata #--output-filter="repeat = 0 || repeat = 1"

#sudo ./zmap 217.182.72.152 -P 4000 -p 1434 -M udp --probe-args=hex:02   -n 1000000   -u zmap.txt   --output-file=217_182 --output-module=csv --output-fields="saddr, icmp_timestamp, icmp_elapsed, icmp_rtt"  --metadata-file=metadata #--output-filter="repeat = 0 || repeat = 1"

#sudo ./zmap 101.133.156.128 -r 100 --batch=10 -P 5 -p 1434 -M udp --probe-args=hex:02   -n 4000  -u zmap.txt   --output-file=output --output-module=csv --output-fields="saddr,icmp_timestamp,icmp_elapsed,icmp_rtt"  --metadata-file=metadata 
#sudo ./zmap 101.133.156.128 -P 500000 -p 1434 -M udp --probe-args=hex:02   -n 100000 -u zmap.txt   --output-file=output --output-module=csv --output-fields="saddr,icmp_timestamp,icmp_elapsed,icmp_rtt"  --metadata-file=metadata 
# 1 packet per ip and 1 packet per batch: maximum sending rate: around 80,000pps

#rate=3
#which=1
#path="/home/qi/Documents/tcpdump/rate_1"
#output_file="$path/rtt_$which"
#log_file="$path/log_$which"
#sudo ./zmap 106.15.10.234	-r $rate -P 1 --batch=1	-p 1434 -M udp --probe-args=hex:02 -u $log_file --output-file=$output_file --output-module=csv --output-fields="saddr,icmp_timestamp,icmp_elapsed,icmp_rtt" --metadata-file=metadata


#rate=3
#which=3
#path="/home/qi/Documents/acrcy_test"
#output_file="$path/rtt_$which"
#log_file="$path/log_$which"
#terminal_output="$path/base_point_$which"
#sudo ./zmap 139.196.252.190	-r $rate -P 1 --batch=1		-p 1434 -M udp --probe-args=hex:02 -u $log_file --output-file=$output_file --output-module=csv --output-fields="saddr,icmp_timestamp,icmp_elapsed,icmp_rtt" --metadata-file=metadata > $terminal_output

# -w --allowlist-file=path
#rate=5000
#which=2
#path="/home/qi/Documents/asfinder"
#output_file="$path/rtt_$which"
#log_file="$path/log_$which"
#sudo ./zmap 	-w allowlist -r $rate -P 5 --batch=5	-p 1434 -M udp --probe-args=hex:02 -u $log_file --output-file=$output_file --output-module=csv --output-fields="saddr,icmp_timestamp,icmp_elapsed,icmp_rtt" --metadata-file=metadata

rate=1000
per_ip=3
batch=1
rate=500
per_ip=3
interval=15
coolTime=15

which=35
path="/home/qi/Documents/output"
output_file="$path/rtt_$which"
status_file="$path/status_$which"
log_file="$path/log_$which"
error_file="$path/error_$which"

metadata="$path/metadata_$which"
sudo ./zmap 	  -a alivelist -w allowlist -M udp --probe-args=latency:0000 -r $rate -P $per_ip -g $interval --batch=$batch -c $coolTime -p 65535	-l $log_file -u $status_file --output-file=$output_file --output-module=csv --output-fields="icmp_responder,saddr,icmp_type,icmp_code,icmp_timestamp,icmp_elapsed,icmp_rtt,icmp_subnet,icmp_subnet_len,icmp_next_digit" --metadata-file=$metadata > $error_file


















