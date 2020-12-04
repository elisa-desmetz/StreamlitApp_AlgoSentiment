FROM python:3.8-alpine

EXPOSE 8501

WORKDIR /mystapp

COPY requirements.txt .

# virtualenv
ENV VIRTUAL_ENV=/opt/venv
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

# add and install requirements
RUN pip install --upgrade pip
COPY ./requirements.txt .
RUN pip install -r requirements.txt

COPY src/ .

CMD streamlit run algo.py