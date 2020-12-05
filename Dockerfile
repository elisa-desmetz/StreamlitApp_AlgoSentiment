FROM python:3.8-alpine

EXPOSE 8501

WORKDIR /mystapp

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY src/ .

CMD streamlit run algo.py