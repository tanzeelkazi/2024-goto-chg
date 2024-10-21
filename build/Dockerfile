FROM quay.io/jupyter/datascience-notebook:2024-10-07

USER root

RUN mkdir -p /opt/jovyan/scratch \
    && \
    chown -R jovyan:users /opt/jovyan

USER jovyan

WORKDIR /home/jovyan/work

RUN git clone https://github.com/hammer-mt/ai-blogpost-generator.git

RUN cd /home/jovyan/work/ai-blogpost-generator \
    && \
    pip3 install -U pip \
    && \
    python3 -m venv venv

RUN cd /home/jovyan/work/ai-blogpost-generator \
    && \
    source venv/bin/activate \
    && \
    pip3 install -r ./requirements.txt \
    && \
    source deactivate

RUN cp -r /home/jovyan/work/ai-blogpost-generator /opt/jovyan/scratch/

ADD ./files/20-clone-repo.sh /usr/local/bin/before-notebook.d/20-clone-repo.sh
ADD ./files/gen-passwd.sh /home/jovyan/gen-passwd.sh
ADD ./files/jupyter-auth-passwd.py /home/jovyan/jupyter-auth-passwd.py

ENV JUPYTER_HASHED_PASS='argon2:$argon2id$v=19$m=10240,t=10,p=8$gmdG5ASwmJsQOQQ6dndZEg$ESrTGerHOI6sv9WCzw7EZu3AqwyWS7vxom4qCWpcBTs'
ENV RESTARTABLE=yes

WORKDIR /home/jovyan

CMD [ \
    "start-notebook.py", \
    "--PasswordIdentityProvider.hashed_password='argon2:$argon2id$v=19$m=10240,t=10,p=8$gmdG5ASwmJsQOQQ6dndZEg$ESrTGerHOI6sv9WCzw7EZu3AqwyWS7vxom4qCWpcBTs'" \
]
