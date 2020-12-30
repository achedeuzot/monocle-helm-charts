{{/*
Expand the name of the chart.
*/}}
{{- define "monocle.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "monocle.fullname" -}}
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
{{- define "monocle.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "monocle.labels" -}}
helm.sh/chart: {{ include "monocle.chart" . }}
{{ include "monocle.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "monocle.selectorLabels" -}}
app.kubernetes.io/name: {{ include "monocle.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "monocle.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "monocle.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}


{{/*
=======================================================================================
==================                 MONOCLE API                    =====================
=======================================================================================
*/}}

{{/*
Expand the name of the chart.
*/}}
{{- define "monocle.api.name" -}}
{{- printf "%s-%s" (include "monocle.name" .) "api"| trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "monocle.api.fullname" -}}
{{- printf "%s-%s" (include "monocle.fullname" .) "api"| trunc 63 | trimSuffix "-" }}
{{- end }}


{{/*
Selector labels
*/}}
{{- define "monocle.api.selectorLabels" -}}
app.kubernetes.io/name: {{ include "monocle.api.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
=======================================================================================
==================                 MONOCLE CRAWLER                =====================
=======================================================================================
*/}}

{{/*
Expand the name of the chart.
*/}}
{{- define "monocle.crawler.name" -}}
{{- printf "%s-%s" (include "monocle.name" .) "crawler"| trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "monocle.crawler.fullname" -}}
{{- printf "%s-%s" (include "monocle.fullname" .) "crawler"| trunc 63 | trimSuffix "-" }}
{{- end }}


{{/*
Selector labels
*/}}
{{- define "monocle.crawler.selectorLabels" -}}
app.kubernetes.io/name: {{ include "monocle.crawler.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
=======================================================================================
==================                 MONOCLE WEB                    =====================
=======================================================================================
*/}}

{{/*
Expand the name of the chart.
*/}}
{{- define "monocle.web.name" -}}
{{- printf "%s-%s" (include "monocle.name" .) "web"| trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "monocle.web.fullname" -}}
{{- printf "%s-%s" (include "monocle.fullname" .) "web"| trunc 63 | trimSuffix "-" }}
{{- end }}


{{/*
Selector labels
*/}}
{{- define "monocle.web.selectorLabels" -}}
app.kubernetes.io/name: {{ include "monocle.web.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}