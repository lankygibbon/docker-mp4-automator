FROM python:3

RUN mkdir /data

# install ffmpeg
RUN apt-get update -qq && apt-get install python-pip ffmpeg -y -qq

RUN git clone https://github.com/mdhiggins/sickbeard_mp4_automator /app
#RUN pip install requests requests[security] requests-cache babelfish "guessit<2" stevedore==1.19.1 python-dateutil qtfaststart tmdbsimple
RUN pip install --no-cache-dir -r /app/setup/requirements.txt

WORKDIR /app
# Copy local config file
COPY autoProcess.ini .

ENTRYPOINT ["/app/manual.py", "-i", "/data/", "-a"]
