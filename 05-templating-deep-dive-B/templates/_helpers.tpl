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

{{/* Expects a port to be passed as the context }}
{{- define "templating-deep-dive.validators.portRange" -}}
{{ $sanitizedPort := int . -}}
{{ if or (lt $sanitizedPort 1) (gt $sanitizedPort 65535 ) }}
{{- fail "Error: Ports must always be between 1 and 65535." -}}
{{- end -}}
{{- . }}
{{- end - */}}


{{/* Expects a port and typort to be passed as the context */}}
{{- define "templating-deep-dive.validators.service" -}}

{{/* Port validation*/}}
{{- $sanitizedPort := int .port -}}
{{- if or (lt $sanitizedPort 1) (gt $sanitizedPort 65535 ) }}
{{- fail "Error: Ports must always be between 1 and 65535." -}}
{{- end -}}

{{/* Type validation*/}}
{{- $allowedSvcTypes := list "ClusterIP" "NodePort" -}}
{{- if not (has .type $allowedSvcTypes ) -}}
{{- fail (printf "Error: Invalid service type %s. Supported values are: %s" .type (join "," $allowedSvcTypes)) -}}
{{- end -}}

{{- end -}}