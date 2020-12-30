Monocle Helm Charts
===================

These Helm charts are to be used to deploy monocle to a kubernetes cluster.

The monocle `config.yaml` data is passed as a value and saved into a `Secret`
as the configuration contains the authentication token, which is sensitive
information. See the `values.yaml` file for an example.

For more details on the `config.yaml` file, see the [official monocle repo](https://github.com/change-metrics/monocle/).

## Local usage
If you want to run this helm chart locally, you can use
the `values.local.yaml` which makes the elasticsearch cluster
compatible with a minikube or similar cluster.

## Installation
You'll need to customize the `values.yaml` corresponding to your needs.
Your cluster must also support auto-provisionning of `PersistentVolumeClaims`.

Once the chart installed, the application can be accessed using the following commands:
`kubectl port-forward svc/monocle-web 3000` and `kubectl port-forward svc/monocle-api 9876 9877`.

The UI will be available on `http://localhost:3000`.

There is no ingress setup yet, contributions are welcome.

## Caveats
After a configuration file change, you'll need to re-spawn the `monocle-api`
and `monocle-crawler` pods.
