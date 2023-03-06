FROM almalinux
COPY test_sc.sh .
RUN chmod ugo+x test_sc.sh
RUN yum install tree -y
CMD ./test_sc.sh
