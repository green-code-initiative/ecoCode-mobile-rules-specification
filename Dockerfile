FROM pandoc/latex:2.13 as builder
COPY ./ /data/
RUN /data/build.sh

FROM nginx:1.19
COPY --from=builder /data/build/html/* /usr/share/nginx/html/
COPY --from=builder /data/build/pdf/*.pdf /usr/share/nginx/html/
