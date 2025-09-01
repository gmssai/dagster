{{- define "dagsterYaml.postgresql.config" }}
postgres_db:
  username: {{ toJson .Values.postgresql.postgresqlUsername }}
  password:
    env: DAGSTER_PG_PASSWORD
  hostname: {{ include "dagster.postgresql.host" . }}
  db_name: {{ toJson .Values.postgresql.postgresqlDatabase }}
  port: {{ toJson .Values.postgresql.service.port }}
  params: {{- .Values.postgresql.postgresqlParams | toYaml | nindent 4 }}
  {{- if .Values.postgresql.postgresqlScheme }}
  scheme: {{ toJson .Values.postgresql.postgresqlScheme }}
  {{- end }}
{{- end }}
