{{- define "templating-deep-dive.fullName" -}}
{{/*-  $fullname := printf "%s-%s" .Release.Name .Chart.Name }}
{{- if .Values.customName }}
{{- $fullname = .Values.customName }}
{{- end }}
{{- $fullname | trunc 63 | trimSuffix "-" -*/}}
{{-  $defaultName := printf "%s-%s" .Release.Name .Chart.Name }}
{{-  .Values.customName | default  $defaultName | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- define "templating-deep-dive.selectorLabels" -}}
app: {{ .Chart.Name }}
release: {{ .Release.Name }}
{{- end -}}