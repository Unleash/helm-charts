{{/*
Expand the name of the chart.
*/}}
{{- define "unleash-enterprise.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "unleash-enterprise.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "unleash-enterprise.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "unleash-enterprise.labels" -}}
helm.sh/chart: {{ include "unleash-enterprise.chart" . }}
{{ include "unleash-enterprise.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "unleash-enterprise.selectorLabels" -}}
app.kubernetes.io/name: {{ include "unleash-enterprise.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "unleash-enterprise.serviceAccountName" -}}
{{- if .Values.serviceAccount }}
{{- if .Values.serviceAccount.create }}
{{- default (include "unleash-enterprise.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- else }}
{{- "default" }}
{{- end }}
{{- end }}
{{/*
Include CNPG env block
*/}}
{{- define "unleash-enterprise.cnpg.env" -}}
{{ include "unleash-enterprise.cnpg.env.block" . }}
{{- end }}

{{- define "unleash-enterprise.byo.env" -}}
{{ include "unleash-enterprise.byo.env.block" . }}
{{- end }}
