# Sweet Postgres Exporter for Prometheus

Forked from https://github.com/wrouesnel/postgres_exporter

Build with:

```
$ make build
```

If you want to try it quickly on your local machine after make, run:

```
$ make run
```

Start Demo in OpenShift:

```
$ make ocdemo
```

Cleanup OpenShift assets:

```
$ make ocpurge
```

Environment variables and volumes
----------------------------------

The image recognizes the following environment variables that you can set during
initialization by passing `-e VAR=VALUE` to the Docker `run` command.

|    Variable name           |    Description      | Default       |
| :------------------------- | ------------------- | ------------- |
|  `DATA_SOURCE_USER`        | Postgres Username   | undef         |
|  `DATA_SOURCE_PASS`        | Postgres Password   | undef         |
|  `DATA_SOURCE_HOST`        | Postgres Host       | undef         |
|  `DATA_SOURCE_DBNAME`      | Postgres Database   | undef         |
|  `DATA_SOURCE_SSL`         | SSL Mode            | undef         |
