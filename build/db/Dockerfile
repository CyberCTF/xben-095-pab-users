# Overlay of the benchmark's mysql/Dockerfile (that folder is vendored unchanged in app/, moved here from build/web/app/mysql/).
# What differs from upstream:
# - the COPY sources point into app/ (this folder is the build context);
# - mysql:5.7.15 is now mysql:5.7.44: Docker can no longer pull mysql:5.7.15 (an old schema 1 manifest); 5.7.44 is the last 5.7 release.
# Everything else is upstream's, line for line.

FROM mysql:5.7.44

ENV MYSQL_ROOT_PASSWORD=password
ADD app/init.sql /docker-entrypoint-initdb.d

EXPOSE 3306
