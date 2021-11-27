#!/bin/bash
mkdir tempdir
mkdir tempdir/templates
mkdir tempdir/static

cp midterm_app.py tempdir/.
cp -r static/* tempdir/static/.
cp -r static/* tempdir/static/. 

echo "FROM python" >> tempdir/Dockerfile
echo "RUN pip install flask" >> tempdir/Dockerfile

echo "COPY  ./static /home/myapp/templates/" >> tempdir/Dockerfile
echo "COPY  ./templates /home/myapp/templates" >> tempdir/Dockerfile
echo "COPY  midterm_app.py /home/myapp/" >> tempdir/Dockerfile

echo "EXPOSE 5000" >> tempdir/Dockerfile
echo "CMD python3 /home/myapp/midterm_app.py" >> tempdir/Dockerfile

cd tempdir

docker build -t midtermapp .
docker run -t -d -p 5000:5000 --name midtermapprunning midtermapp
docker ps -a