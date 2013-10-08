# btsync + fluentdToMongodb


FROM genuinegreg/btsync

RUN apt-get update
RUN apt-get install -y dstat

RUN wget -q -O- http://toolbelt.treasure-data.com/sh/install-ubuntu-precise.sh | sh

RUN apt-get clean

ADD td-agent/td-agent.conf /etc/td-agent/td-agent.conf
ADD td-agent/plugin/in_dstat.rb /etc/td-agent/plugin/in_dstat.rb

ADD run.sh /run.sh

CMD /run.sh