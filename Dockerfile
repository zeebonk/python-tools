FROM python:3.7.4-alpine3.10

WORKDIR /python-tools
ENV WORKDIR /python-tools

RUN apk add --no-cache npm
RUN npm install --global prettier@1.18.2

RUN pip install --no-cache-dir --upgrade pip
RUN pip install --no-cache-dir \
    isort==4.3.21 \
    black==19.3b0 \
    flake8==3.7.8 \
    flake8-docstrings==1.3.0 \
    flake8-bugbear==19.3.0 \
    darglint==0.5.7

# This is needed because flake8-docstrings 1.3.0 isn't compatible with
# pydocstyle 4.0.0 yet.
RUN pip install pydocstyle==3.0.0

ADD entrypoint.sh setup.cfg .prettierrc ./
RUN chmod 755 entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]

