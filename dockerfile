FROM python:3.8-slim as builder
COPY . /src
RUN pip install -y -r requirements.txt

FROM python:3.8-slim as app
COPY --from=builder /root/.local /root/.local
COPY --from=builder /src .

ENV PATH=/root/.local:$PATH
EXPOSE 5000

CMD ["python3", "app.py"]
