createrepo repo
docker build -t svcipxe .
docker tag svcipxe ctl.ncc9.com:5000/svcipxe
docker push ctl.ncc9.com:5000/svcipxe

