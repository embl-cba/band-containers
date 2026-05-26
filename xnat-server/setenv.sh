export CATALINA_OPTS="$CATALINA_OPTS -Xms512m"
export CATALINA_OPTS="$CATALINA_OPTS -Xmx4096m"
export CATALINA_OPTS="$CATALINA_OPTS -XX:MaxPermSize=256m"
export CATALINA_OPTS="${CATALINA_OPTS} -Dxnat.home=/data/xnat/home -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=8000"
