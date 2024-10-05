tomcat_home=/home/was/tomcat-8080
tomcat_shutdown=/home/was/tomcat-8080/bin/shutdown.sh
tomcat_start=/home/was/tomcat-8080/bin/startup.sh

export LANG=ko_KR.UTF-8

echo "Line:${LINENO} > Shutdown tomcat now...."
bash ${tomcat_shutdown}
echo "Line:${LINENO} > tomcat is now terminated..."

sleep 3

if [ -z "`ps -eaf | grep java | grep /WAS/apache-tomcat-9.0.19/bin`" ]; then
        echo "Line:${LINENO} > Tomcat was terminated successfully."
else
        ps -eaf | grep java | grep ${tomcat_home}/bin | awk '{print $2}' | while read PID
                do
                        echo "Line:${LINENO} > Killing $PID... "
                        kill -9 $PID
                        echo "Line:${LINENO} > Tomcat is being shutdowned"
                done
fi

echo "Line:${LINENO} > tomcat restart now"
bash ${tomcat_start}

if [ -z "`ps -eaf | grep java | grep ${tomcat_home}/bin`" ]; then
        echo "Line:${LINENO} > Error!!! Cannot start tomcat server."
else
        echo "Line:${LINENO} > Tomcat restart succcessfully. "
fi

echo "Line:${LINENO} > Job finished"