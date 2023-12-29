FROM python:3.10.9-slim

RUN apt update
RUN apt-get install -y ffmpeg
RUN apt install python3-pip -y
RUN apt-get install wget -y
RUN apt-get install nano -y

RUN mkdir /app
ADD . /app
WORKDIR /app
RUN pip install -r requirements.txt
RUN cd TTS
RUN rm -R TikTok.py
RUN wget https://github.com/Zeyso/TikTok.py/blob/main/TikTok.py
RUN cd ..

# tricks for pytube : https://github.com/elebumm/RedditVideoMakerBot/issues/142 
# (NOTE : This is no longer useful since pytube was removed from the dependencies)
# RUN sed -i 's/re.compile(r"^\\w+\\W")/re.compile(r"^\\$*\\w+\\W")/' /usr/local/lib/python3.8/dist-packages/pytube/cipher.py

CMD ["python3", "main.py"]
