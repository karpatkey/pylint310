FROM python:3.10

RUN pip install --upgrade pip

RUN pip install --no-cache-dir \
    black==23.3.0 \
    flake8==6.0.0 \
    isort==5.12.0 \
    flake8-pyproject==1.2.3

COPY ./lint.sh /lint.sh
ENTRYPOINT ["/lint.sh"]

COPY ./pretty.sh /pretty.sh
WORKDIR /repo
